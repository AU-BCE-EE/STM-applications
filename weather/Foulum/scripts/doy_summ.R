# Prepare Foulum weather data for input in stm model

library(lubridate)
source('../functions/rounddf.R')

dat <- read.csv('../measurements/450165307.csv')
head(dat)

# Sort out date
dat$date <- dmy(dat$date)
dat$doy <- as.integer(as.character(dat$date, format = '%j'))
dat$year <- as.integer(as.character(dat$date, format = '%Y'))

# Tjele location measurements started Sept 22, 2020 (see STM-applications/temp_meas/data-all/dates.csv)
# But continued into November 2021
# So here take Oct days from 2020 and end 2021 end of September
# Get doy 275 below
cut.doy <- as.integer(as.character(as.Date('2020-10-01'), format = '%j'))

# Convert radiation from MJ/m2 (per d) to W/m2
dat$glorad <- signif(dat$glorad * 1E6 / 86400, 3)

datd <- dat[(dat$year == 2020 & dat$doy >= cut.doy) | (dat$year == 2021 & dat$doy < cut.doy), c('doy', 'temp', 'glorad')]

write.table(datd, '../output/Foulum_weather.txt', row.names = FALSE)
