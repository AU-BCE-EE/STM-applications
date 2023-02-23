
# Merge
meas[, slurry_temp_meas := temp]
dat <- merge(meas, mod, by = c('site', 'date', 'doy'), all = FALSE)

# long format for plots
dl <- melt(dat, id.vars = c('site', 'date', 'doy'),
           measure.vars = c('air_temp', 'slurry_temp', 'slurry_temp_meas'))

dl$variable <- factor(dl$variable, levels = c('air_temp', 'slurry_temp_meas', 'slurry_temp'), 
		      labels = c('Measured air', 'Measured slurry', 'STM slurry'))
