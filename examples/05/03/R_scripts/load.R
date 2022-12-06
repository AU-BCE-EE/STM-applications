
# Measurements
meas <- read.csv('../meas_temp/daily_meas_temp.csv')

meas$date <- as.POSIXct(meas$date)

# Model results
mod <- data.frame()
ff <- list.files('../stm_output', pattern = 'temp.csv')
for (i in ff) {
  d <- read.csv(paste0('../stm_output/', i), skip = 2, header = TRUE)
  d$site <- substr(i, 1, 1)
  mod <- rbind(mod, d)
}

mod$year <- 2017 + mod$year
mod$date <- as.POSIXct(paste(mod$year, mod$doy), format = '%Y %j')
# Drop 2 start-up years
mod <- subset(mod, year > 2019)

# Rates
rates <- data.frame()
ff <- list.files('../stm_output', pattern = 'rates.csv')
for (i in ff) {
  d <- read.csv(paste0('../stm_output/', i), skip = 2, header = TRUE)
  d$site <- substr(i, 1, 1)
  rates <- rbind(rates, d)
}

rl <- melt(rates, id.vars = c('day', 'doy', 'year', 'site'), 
	   measure.vars = c('rad', 'air', 'floor', 'lower_wall', 'upper_wall', 'total'))

rl$variable <- factor(rl$variable, levels = c('total', 'air', 'rad', 'upper_wall', 'lower_wall', 'floor'),
                                   labels = c('Total', 'Air', 'Radiation', 'Upper wall', 'Lower wall', 'Floor'))

