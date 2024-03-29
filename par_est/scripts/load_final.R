# Read in calculated temperatures

mod <- data.table()
ff <- list.files('../stm_output_final', pattern = 'temp.csv')
for (i in ff) {
  d <- fread(paste0('../stm_output_final/', i), skip = 2, header = TRUE)
  d$site <- substr(i, 1, 1)
  mod <- rbind(mod, d)
}

# See res_calc.R for comments
mod$year[mod$site != 'F'] <- 2017 + mod$year[mod$site != 'F']
mod$year[mod$site == 'F'] <- 2012 + mod$year[mod$site == 'F']
mod$date <- as.POSIXct(paste(mod$year, mod$doy), format = '%Y %j', tz = 'UTC')

## Check that mod values incldue all measurements!
#range(subset(mod, site == 'A')$date)
#range(subset(meas, site == 'A')$date)
#range(subset(mod, site == 'F')$date)
#range(subset(meas, site == 'F')$date)

# Merge measured and calculated
dat <- merge(meas[, c('site', 'date', 'temp')], mod[, c('site', 'date', 'slurry_temp', 'air_temp')], by = c('site', 'date'))
names(dat)[names(dat) %in% c('temp', 'slurry_temp')] <- c('slurry_temp_meas', 'slurry_temp_mod')

# Get radiation too for comparison
wthr <- data.table()
ff <- list.files('../weather')
for (i in ff) {
  d <- fread(paste0('../weather/', i), skip = 1, header = FALSE)[, 1:3]
  names(d) <- c('doy', 'air_temp', 'rad')
  d$loc <- substr(i, 1, 3)
  wthr <- rbind(wthr, d)
}


