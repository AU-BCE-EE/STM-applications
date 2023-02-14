# Prepare Foulum (Tjele) weather data for input in stm model

library(lubridate)
source('../../../R_functions/rounddf.R')

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

dat$air.temp <- dat$temp

datd <- dat[(dat$year == 2020 & dat$doy >= cut.doy) | (dat$year == 2021 & dat$doy < cut.doy), c('doy', 'air.temp', 'glorad', 'date', 'year')]

# Sorting not necessary but for viewing
datd <- datd[order(datd$doy), ]

write.csv(datd, '../output/Tjele_weather.csv', row.names = FALSE)

png('../plots/Tjele_air_temp.png', height = 500, width = 500)
  plot(air.temp ~ doy, data = datd, type = 'o')
dev.off()

png('../plots/Tjele_radiation.png', height = 500, width = 500)
  plot(glorad ~ doy, data = datd, type = 'o')
dev.off()
