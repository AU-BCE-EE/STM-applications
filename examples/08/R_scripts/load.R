
# Measurements
meas <- fread('../temp_meas/daily_meas_temp_H.csv')
meas[, site := 'H']

meas$date <- as.POSIXct(meas$date, tz = 'EST')

# Model results
mod <- data.frame()
ff <- list.files('../stm_output', pattern = 'temp.csv')
for (i in ff) {
  d <- fread(paste0('../stm_output/', i), skip = 2, header = TRUE)
  d$site <- substr(i, 1, 1)
  mod <- rbind(mod, d)
}

mod$year <- 2016 + mod$year
mod$date <- as.POSIXct(paste(mod$year, mod$doy), format = '%Y %j', tz = 'EST')
# Drop 2 start-up years
mod <- subset(mod, year > 2019)

# Rates
rates <- data.frame()
ff <- list.files('../stm_output', pattern = 'rates.csv')
for (i in ff) {
  d <- fread(paste0('../stm_output/', i), skip = 2, header = TRUE)
  d$site <- substr(i, 1, 1)
  rates <- rbind(rates, d)
}

rl <- melt(rates, id.vars = c('day', 'doy', 'year', 'site'), 
	   measure.vars = c('rad', 'air', 'floor', 'lower_wall', 'upper_wall', 'total'))

rl$variable <- factor(rl$variable, levels = c('total', 'air', 'rad', 'upper_wall', 'lower_wall', 'floor'),
                                   labels = c('Total', 'Air', 'Radiation', 'Upper wall', 'Lower wall', 'Floor'))

wthr <- data.frame()
ff <- list.files('../stm_output', pattern = 'weather.csv')
for (i in ff) {
  d <- fread(paste0('../stm_output/', i), skip = 2, header = TRUE)
  d$site <- substr(i, 1, 1)
  wthr <- rbind(wthr, d)
}
wthr$year <- 2016 + wthr$year
wthr$date <- as.POSIXct(paste(wthr$year, wthr$doy), format = '%Y %j', tz = 'EST')
wthr <- subset(wthr, year > 2019)
