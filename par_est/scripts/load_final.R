# Read in calculated temperatures

mod <- data.frame()
ff <- list.files('../stm_output', pattern = 'temp.csv')
for (i in ff) {
  d <- read.csv(paste0('../stm_output/', i), skip = 2, header = TRUE)
  d$site <- substr(i, 1, 4)
  mod <- rbind(mod, d)
}

mod$year <- 2019 + mod$year
mod$date <- as.POSIXct(paste(mod$year, mod$doy), format = '%Y %j')

# Merge measured and calculated
head(meas4)
dat <- merge(meas4[, c('site', 'site.full', 'date', 'temp')], mod[, c('site', 'date', 'slurry_temp', 'air_temp')], by = c('site', 'date'))
names(dat)[names(dat) %in% c('temp', 'slurry_temp')] <- c('slurry_temp_meas', 'slurry_temp_mod')
