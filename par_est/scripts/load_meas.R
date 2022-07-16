# Measurements

meas <- read.csv('../../temp_meas/data-daily/daily_meas_temp.csv')
meas$date <- as.POSIXct(meas$date)

