# Prepare Uppsala weather data for input in stm model
# Note that model currently accepts one obs per DOY

library(lubridate)
source('../functions/rounddf.R')

dat <- read.csv('../measurements/Uppsala_weather.csv', skip = 2)

# Sort out time
dat$hour <- sprintf('%04d', dat$hour)
dat$date.time <- ymd_hm(paste(dat$date, dat$hour))
dat$doy <- as.integer(as.character(dat$date.time, format = '%j'))
dat$year <- as.integer(as.character(dat$date.time, format = '%Y'))
dat$date <- date(dat$date.time)

# Subset
# Raanas site measurements started 7 May 2020 ended 25 May 2021
# Use 2021 measurements for May
dat <- subset(dat, date >= ymd('2020 06 01') & date <= ymd('2021 07 31'))

# Summarize by doy
mns <- aggregate(dat[, c('temp.1.5m', 'rad')], dat[, c('doy'), drop = FALSE], mean)
yrs <- aggregate(dat[, c('year')], dat[, c('doy'), drop = FALSE], function(x) x[1])
ns <- aggregate(dat[, c('temp.1.5m')], dat[, c('doy'), drop = FALSE], function(x) length(x))
datd <- merge(mns, yrs, by = 'doy')
datd <- rounddf(datd, 3, signif)

# Check n
if (any(ns$n > 24)) stop('Count error')

write.csv(datd, '../output/Uppsala_weather.csv', row.names = FALSE)
