# Sort out measurements of slurry temperature

measd$measde.time <- ymd_hm(measd$date.time)
measd$date <- as.POSIXct(substr(measd$measde.time, 1, 10))
measd$height <- paste(measd$height, ' m')

# Fix site
measd$site.full <- measd$site
measd$site <- substr(measd$site, 1, 4)
measd$site[measd$site == 'Rånä'] <- 'Raan'

# Average temperature
meas <- aggregate(temp ~ site + site.full + date, data = measd, FUN = mean)
meas4 <- meas

# Use only 3 for calibration
meas <- subset(meas, site %in% c('Back', 'Fitt', 'Raan'))


