
dat$day.of.month <- as.character(dat$date, format = '%d')
mdat <- subset(dat, day.of.month == 15)

write.csv(dat, '../output/time_series.csv', row.names = FALSE)
write.csv(mdat, '../output/month_series.csv', row.names = FALSE)
