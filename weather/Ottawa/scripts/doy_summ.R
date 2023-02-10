# Prepare Ottawa weather data for input in stm model

rm(list = ls())

library(data.table)

source('../../functions/rounddf.R')

dat <- fread('../measurements/ottawa_sel.csv')
dat <- dat[order(dat$year, dat$doy), ]

# Sort out date
dat$date <- as.POSIXct(paste(dat$year, dat$doy), format = '%Y %j')
dat$doy <- as.integer(as.character(dat$date, format = '%j'))
dat$year <- as.integer(as.character(dat$date, format = '%Y'))

# Ottawa location measurements started DOY 220 (8 Aug) 2015 and ended 277 (3 Oct) 2015 (see STM-applications/temp_meas/data-all/dates.csv)
# So here we try to split difference
cut.doy <- 205

# Convert radiation from MJ/m2 (in an hour) to W/m2
dat$glorad <- dat$rad * 1E6 / 3600

# Trim 
dat <- dat[(dat$year == 2015 & dat$doy >= cut.doy) | (dat$year == 2016 & dat$doy < cut.doy), c('doy', 'temp', 'glorad')]

# Daily means
datd <- dat[, .(temp = mean(temp), glorad = mean(glorad)), by = doy]

datd <- rounddf(datd, 4, func = signif)
datd <- datd[order(datd$doy), ]

write.csv(datd, '../output/Ottawa_weather.csv', row.names = FALSE)
