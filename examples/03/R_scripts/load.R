
# Measurements
dat <- read.csv('../meas_temp/Sweden_storage_temp.csv')
dat$date.time <- ymd_hm(dat$date.time)
dat$date <- as.POSIXct(substr(dat$date.time, 1, 10))
dat$depth <- paste(dat$depth, ' m')

# Fix site
dat$site <- substr(dat$site, 1, 4)
dat$site[dat$site == 'Rånä'] <- 'Raan'

# Subset to only Raan
dat <- subset(dat, site == 'Raan')

# Average measured temperature
dm <- aggregate(temp ~ site + date, data = dat, FUN = mean)

# Tjele data
ddt <- read.csv('../meas_temp/Tjele_storage_temp.csv')
ddt$date.time <- ymd_hm(ddt$date.time)
ddt$date <- as.POSIXct(substr(ddt$date.time, 1, 10))
dmt <- aggregate(temp ~ site + date, data = ddt, FUN = mean)

dm <- rbind(dm, dmt)

dat <- rbind(dat, ddt)
# NTS: name problems with height!

# Model results
mod <- data.frame()
ff <- list.files('../stm_output', pattern = 'temp.csv')
for (i in ff) {
  d <- read.csv(paste0('../stm_output/', i), skip = 2, header = TRUE)
  d$site <- substr(i, 1, 4)
  mod <- rbind(mod, d)
}

mod$year <- 2018 + mod$year
mod$date <- as.POSIXct(paste(mod$year, mod$doy), format = '%Y %j')
# Drop start-up year
mod <- subset(mod, year > 2019)

# Rates
rates <- data.frame()
ff <- list.files('../stm_output', pattern = 'rates.csv')
for (i in ff) {
  d <- read.csv(paste0('../stm_output/', i), skip = 2, header = TRUE)
  d$site <- substr(i, 1, 4)
  rates <- rbind(rates, d)
}

rl <- melt(rates, id.vars = c('day', 'doy', 'year', 'site'), 
	   measure.vars = c('rad', 'air', 'floor', 'lower_wall', 'upper_wall', 'total'))

rl$variable <- factor(rl$variable, levels = c('total', 'air', 'rad', 'upper_wall', 'lower_wall', 'floor'),
                                   labels = c('Total', 'Air', 'Radiation', 'Upper wall', 'Lower wall', 'Floor'))

