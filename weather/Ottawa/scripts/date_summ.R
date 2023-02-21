# Calculate means by date

rm(list = ls())

library(data.table)

source('../../../R_functions/rounddf.R')

dat <- data.table::fread('../measurements/ottawa_sel.csv')

# Sort out date
dat$date <- as.POSIXct(paste(dat$year, dat$doy), format = '%Y %j')
dat$doy <- as.integer(as.character(dat$date, format = '%j'))
dat$year <- as.integer(as.character(dat$date, format = '%Y'))

# Remove duplicate row with what seems to be erroneous temperaure value 
dat <- dat[doy != 83 | temp != 1.517]

# Convert radiation from MJ/m2 (in an hour) to W/m2
dat$glorad <- dat$rad * 1E6 / 3600

# Daily means
datd <- dat[, .(air.temp = mean(temp), glorad = mean(glorad), n = sum(!is.na(temp)), year = year[1], doy = doy[1]), by = date]

datd <- rounddf(datd, 3, func = signif)
datd <- datd[order(date)]

if (any(datd$n > 24)) stop('Something wrong! n > 24.')

# Drop errors
datd <- datd[n == 24, ]
datd <- datd[glorad < 1000 & glorad > 0, ]

write.csv(datd, '../output/Ottawa_weather_by_date.csv', row.names = FALSE)

png('../plots/Ottawa_air_temp_date.png', height = 500, width = 500)
  plot(air.temp ~ date, data = datd, type = 'o')
dev.off()

png('../plots/Ottawa_radiation_date.png', height = 500, width = 500)
  plot(glorad ~ date, data = datd, type = 'o')
dev.off()
