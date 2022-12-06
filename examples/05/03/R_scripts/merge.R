
# Merge
meas$temp.slurry.meas <- meas$temp
dat <- merge(meas, mod, by = c('site', 'date'), all = FALSE, all.y = TRUE)
dat <- subset(dat, date >= min(meas$date) & date <= max(meas$date))

# long format for plots
dl <- melt(dat, id.vars = c('site', 'date', 'doy', 'year'),
           measure.vars = c('air_temp', 'slurry_temp', 'temp'))

dl$variable <- factor(dl$variable, levels = c('air_temp', 'temp', 'slurry_temp'), 
		      labels = c('Measured air', 'Measured slurry', 'STM slurry'))

# Drop faulty early 4 points from site E
dl <- subset(dl, date > as.Date('2020-09-25') | site != 'E')
