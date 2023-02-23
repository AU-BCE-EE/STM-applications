# Export
# dat.all does not have Ottawa data

write.csv(dat.sel, '../data-daily/daily_meas_temp_H.csv', row.names = FALSE)
write.csv(dates, '../data-all/dates_H.csv', row.names = FALSE)
