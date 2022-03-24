# Prepare Foulum weather data for input in stm model

library(lubridate)
source('../functions/rounddf.R')

dat <- read.csv('../measurements/450165307.csv')
head(dat)

# Sort out date
dat$date <- dmy(dat$date)
dat$doy <- as.integer(as.character(dat$date, format = '%j'))
dat$year <- as.integer(as.character(dat$date, format = '%Y'))

# Convert radiation from MJ/m2 (per d) to W/m2
dat$glorad <- signif(dat$glorad * 1E6 / 86400, 3)

datd <- dat[(dat$year == 2020 & dat$doy >= 266) | (dat$year == 2021 & dat$doy < 266), c('doy', 'temp', 'glorad')]

write.table(datd, '../output/Tjele_weather.txt', row.names = FALSE)
