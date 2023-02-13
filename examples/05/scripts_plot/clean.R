
# First long format for ploting
meas$variable <- 'meas'
meas$date <- as.POSIXct(paste(meas$year, meas$doy), format = '%Y %j')

mod$value <- mod$slurry_temp
mod$year <- 2012 + mod$year
mod$date <- as.POSIXct(paste(mod$year, mod$doy), format = '%Y %j')
mod <- subset(mod, date >= min(meas$date) & date <= max(meas$date))

wthr$value <- wthr$air_temp
wthr$variable <- 'air'
wthr$year <- wthr$year + 2012
wthr$date <- as.POSIXct(paste(wthr$year, wthr$doy), format = '%Y %j')
wthr <- subset(wthr, date >= min(meas$date) & date <= max(meas$date))

dl1 <- rbind(meas[, c('date', 'doy', 'variable', 'value')], 
             mod[, c('date', 'doy', 'variable', 'value')], 
             wthr[, c('date', 'doy', 'variable', 'value')]) 
dl1$variable <- factor(dl1$variable, levels = c('air', 'meas', 'default', 'constant'), 
                       labels = c('Measured air', 'Measured slurry', 'STM slurry A', 'STM slurry B'))

# And a merged data frame for model fit
dl2 <- merge(meas, mod, by = 'date', suffixes = c('.meas', '.mod'))
dl2 <- dl2[!is.na(dl2$value.meas), ]
