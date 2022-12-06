
# Model results
dat <- data.frame()
ff <- list.files('../stm_output', pattern = 'temp.csv')
i <- ff[1]
for (i in ff) {
  d <- read.csv(paste0('../stm_output/', i), skip = 2)
  names(d) <- c('dos', 'doy', 'year', 'mass.slurry', 'mass.frozen', 
                'depth.slurry', 'temp.air', 'temp.wall', 'temp.floor', 
                'temp.slurry')
  d$sim <- strsplit(i, '_')[[1]][1] 
  dat <- rbind(dat, d)
}

dat$year <- 2018 + dat$year
dat$date <- as.POSIXct(paste(dat$year, dat$doy), format = '%Y %j')
# Drop start-up year
dat <- subset(dat, year == 2021)

# Rates
rates <- data.frame()
ff <- list.files('../stm_output', pattern = 'rates.csv')
for (i in ff) {
  d <- read.csv(paste0('../stm_output/', i), skip = 2, header = TRUE)
  d$sim <- strsplit(i, '_')[[1]][1] 
  rates <- rbind(rates, d)
}

rates$year <- 2018 + rates$year
rates$date <- as.POSIXct(paste(rates$year, rates$doy), format = '%Y %j')
# Drop start-up year
rates <- subset(rates, year == 2021)

# Merge in temperature variables
rates <- merge(dat, rates)

rl <- melt(rates, id.vars = c('day', 'doy', 'year', 'sim', 'mass.slurry'), 
	   measure.vars = c('rad', 'air', 'floor', 'lower_wall', 'upper_wall', 'total'))

rl$variable <- factor(rl$variable, levels = c('total', 'air', 'rad', 'upper_wall', 'lower_wall', 'floor'),
                                   labels = c('Total', 'Air', 'Radiation', 'Upper wall', 'Lower wall', 'Floor'))

rl$value.norm <- rl$value / rl$mass.slurry
