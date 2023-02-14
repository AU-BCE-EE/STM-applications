# Prepare Uppsala weather data for input in stm model
# Note that model currently accepts one obs per DOY

rm(list = ls())

library(data.table)

source('../../../R_functions/rounddf.R')

dat <- data.table::fread('../measurements/Uppsala_weather.csv', skip = 2)

# Sort out time
dat$hour <- sprintf('%04d', dat$hour)
dat$date.time <- as.POSIXct(paste(dat$date, dat$hour), format = '%Y%m%d %H%M')
dat$doy <- as.integer(as.character(dat$date.time, format = '%j'))
dat$year <- as.integer(as.character(dat$date.time, format = '%Y'))
dat$date <- as.Date(dat$date.time)

# Subset
# Site B measurements started 30 April 2020 ended 26 May 2021
# So split May, 15 May = DOY 135 (2020) or 136 (2021)
# Problem is this original data file only has 1 year, and starts 15 June!
# So omit subset
## dat <- dat[(year == 2020 & doy >= 135) | (year == 2021 & doy < 135), ]

# Daily means
datd <- dat[, .(air.temp = mean(temp.1.5m), glorad = mean(rad), n = sum(!is.na(temp.1.5m)), year = year[1], date = date[1]), by = doy]

datd <- rounddf(datd, 3, func = signif)
datd <- datd[order(doy)]

if (any(datd$n > 24)) stop('Something wrong! n > 24.')

write.csv(datd, '../output/Uppsala_weather.csv', row.names = FALSE)

png('../plots/Uppsala_air_temp.png', height = 500, width = 500)
  plot(air.temp ~ doy, data = datd, type = 'o')
dev.off()

png('../plots/Uppsala_radiation.png', height = 500, width = 500)
  plot(glorad ~ doy, data = datd, type = 'o')
dev.off()
