# Prepare Ottawa weather data for input in stm model

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

# Ottawa location measurements started DOY 220 (8 Aug) 2015 and ended 277 (3 Oct) 2015 (see STM-applications/temp_meas/data-all/dates.csv)
# So here we try to split difference
dat <- dat[(year == 2015 & doy >= 205) | (year == 2016 & doy < 205), ]

# Daily means
datd <- dat[, .(air.temp = mean(temp), glorad = mean(glorad), n = sum(!is.na(temp)), year = year[1], date = date[1]), by = doy]

datd <- rounddf(datd, 3, func = signif)
datd <- datd[order(doy)]

if (any(datd$n > 24)) stop('Something wrong! n > 24.')

write.csv(datd, '../output/Ottawa_weather.csv', row.names = FALSE)

png('../plots/Ottawa_air_temp.png', height = 500, width = 500)
  plot(air.temp ~ doy, data = datd, type = 'o')
dev.off()

png('../plots/Ottawa_radiation.png', height = 500, width = 500)
  plot(glorad ~ doy, data = datd, type = 'o')
dev.off()
