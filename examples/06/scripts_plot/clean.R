
meas$date <- as.POSIXct(paste(meas$year, meas$doy), format = '%Y %j')

mod$year <- 2012 + mod$year
mod$date <- as.POSIXct(paste(mod$year, mod$doy), format = '%Y %j')
mod$Type <- 'STM'
mod <- subset(mod, date >= min(meas$date) & date <= max(meas$date))

wthr$year <- wthr$year + 2012
wthr$date <- as.POSIXct(paste(wthr$year, wthr$doy), format = '%Y %j')
wthr <- subset(wthr, date >= min(meas$date) & date <= max(meas$date))

meas$variable = 'Measured slurry'
meas$Type <- 'Measured'

mod$value <- mod$slurry_temp
dl <- rbind(meas[, c('date', 'doy', 'variable', 'value', 'Type')], mod[, c('date', 'doy', 'variable', 'value', 'Type')]) 
#mod$variable = 'Air'
#mod$value <- mod$air_temp
#dl <- rbind(dl, mod[, c('date', 'doy', 'variable', 'value')]) 

#dl$variable <- factor(dl$variable, levels = c('Measured slurry', 'STM no heat', 'STM 10C', 'STM 25C'))


