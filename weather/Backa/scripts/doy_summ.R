# Prepare Backa weather data for input in stm model

library(data.table)

source('../../../R_functions/rounddf.R')

dat <- data.table::fread('../measurements/Backa_weather.csv', skip = 0, sep = ';')

# Sort out time
dat$date <- as.Date(as.character(dat$DATUM), format = '%Y%m%d')
dat$doy <- as.integer(as.character(dat$date, format = '%j'))
dat$year <- as.integer(as.character(dat$date, format = '%Y'))

# Subset
# Site D measurements started 7 May 2020 ended 25 May 2021
# See STM-applications/temp_meas/data-all/dates.csv
# So split May between years
# Note that two dates below don't match because this is a leap year!
dat <- dat[date >= as.Date('2020 05 16', format = '%Y %m %d') & date < as.Date('2021 05 17', format = '%Y %m %d'), ]


# Convert radiation from MJ/m2 (per d) to W/m2
# NTS: this looks correct based on final comparison to Uppsala, but need to check with Kristina
dat$glorad <- signif(dat$`Solar rad.` * 1E6 / 86400, 3)
dat$air.temp <- dat$`mean temp`

# Get select columns and sort
datd <- dat[order(doy), c('doy', 'air.temp', 'glorad', 'year', 'date')]

# Round
datd <- rounddf(datd, 3, signif)

write.csv(datd, '../output/Backa_weather.csv', row.names = FALSE)

png('../plots/Backa_air_temp.png', height = 500, width = 500)
  plot(air.temp ~ doy, data = datd, type = 'o')
dev.off()

png('../plots/Backa_radiation.png', height = 500, width = 500)
  plot(glorad ~ doy, data = datd, type = 'o')
dev.off()
