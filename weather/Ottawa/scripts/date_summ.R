# Calculate means by date

rm(list = ls())

library(data.table)

source('interpm.R')

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

#if (any(datd$n > 24)) stop('Something wrong! n > 24.')

# Drop errors
datd[n != 24, `:=` (air.temp = NA, glorad = NA) ]
datd[glorad > 1000 | glorad < 0, glorad := NA]
datd[, `:=` (interp.glorad = FALSE, interp.air.temp = FALSE)]
datd[is.na(glorad), interp.glorad := TRUE]
datd[is.na(air.temp), interp.air.temp := TRUE]

# Interpolate missing values
datd <- as.data.table(interpm(as.data.frame(datd), 'date', c('glorad', 'air.temp')))

write.csv(datd, '../output/Ottawa_weather_by_date.csv', row.names = FALSE)

# Write out just 2020 data
datd2020 <- datd[year == 2020, .(doy, air.temp, glorad, year, date)]
write.csv(datd2020, '../output/Ottawa_weather_2020.csv', row.names = FALSE)

png('../plots/Ottawa_air_temp_date.png', height = 500, width = 500)
  plot(air.temp ~ date, data = datd, type = 'o', col = 'gray45')
  points(air.temp ~ date, data = datd, subset = interp.air.temp, col = 'red')
dev.off()

png('../plots/Ottawa_radiation_date.png', height = 500, width = 500)
  plot(glorad ~ date, data = datd, type = 'o', col = 'gray45')
  points(glorad ~ date, data = datd, subset = interp.air.temp, col = 'red')
dev.off()
