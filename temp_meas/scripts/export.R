# Export
# dat.all does not have Ottawa data

dat.mean <- dat.mean[order(dat.mean$site, dat.mean$date), ]

write.csv(dat.mean, '../data-daily/daily_meas_temp.csv', row.names = FALSE)
write.csv(dat.all, '../data-all/meas_temp.csv', row.names = FALSE)
write.csv(depths, '../data-all/depths.csv', row.names = FALSE)
write.csv(dates, '../data-all/dates.csv', row.names = FALSE)
