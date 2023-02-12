# Measurements

meas <- fread('../../temp_meas/data-daily/daily_meas_temp.csv')
meas$date <- as.POSIXct(meas$date)

# Drop faulty early 4 points from site E
meas <- subset(meas, date > as.Date('2020-09-25') | site != 'E')

