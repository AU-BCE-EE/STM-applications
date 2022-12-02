# Prepare Foulum weather data for input in stm model

library(lubridate)
source('../functions/rounddf.R')

dat <- read.csv('../measurements/489770792.csv')
head(dat)

# Sort out date
dat$date <- dmy(dat$date)
dat$doy <- as.integer(as.character(dat$date, format = '%j'))
dat$year <- as.integer(as.character(dat$date, format = '%Y'))

# Measurements started 26 Oct 2021 and ended morning 4 April 2022
# We'll take earlier doy values from 2021 (will not be used in comparison anyway, and there is no start-up period)
start.date <- as.Date('2021-04-04')
end.date <- as.Date('2022-04-04')

# Convert radiation from MJ/m2 (per d) to W/m2
dat$glorad <- signif(dat$glorad * 1E6 / 86400, 3)

datd <- dat[dat$date >= start.date & dat$date < end.date, c('doy', 'temp', 'glorad')]

write.csv(datd, '../output/weather.csv', row.names = FALSE)

## Check start and end dates for duration
#s <- as.integer(as.character(as.Date('2021-10-26'), format = '%j'))
#l <- as.integer(as.character(as.Date('2021-12-31'), format = '%j'))
#e <- as.integer(as.character(as.Date('2022-04-04'), format = '%j'))
#e + (l - s)
