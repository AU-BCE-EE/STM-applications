# Plot measured and STM slurry temperatures

dat$doy <- as.integer(as.character(dat$date, format = '%j'))

dat <- dat[order(dat$site, dat$doy), ]
ggplot(dat, aes(doy, slurry_temp_meas)) +
  geom_line(aes(doy, air_temp), colour = 'skyblue', lty = 1) +
  geom_line(aes(doy, slurry_temp_mod), colour = 'black') +
  geom_path(col = 'red') +
  facet_wrap(~ site) +
  labs(x = 'Day of year', y = expression('Temperature'~(degree*C)), 
       colour = 'Position (from surface)') +
  theme(legend.position = 'top')
ggsave('../plots/ave_stor_temp_doy.png', height = 6, width = 8)

dat <- dat[order(dat$site, dat$date), ]
ggplot(dat, aes(date, slurry_temp_meas)) +
  geom_line(aes(date, air_temp), colour = 'skyblue', lty = 1) +
  geom_line(aes(date, slurry_temp_mod), colour = 'black') +
  geom_path(col = 'red') +
  facet_wrap(~ site, scales = 'free_x') +
  labs(x = 'Day of year', y = expression('Temperature'~(degree*C)), 
       colour = 'Position (from surface)') +
  theme(legend.position = 'top')
ggsave('../plots/ave_stor_temp_date.png', height = 6, width = 8)

dat <- dat[order(dat$site, dat$doy), ]
ggplot(wthr, aes(doy, rad)) +
  geom_line(colour = 'orange') +
  facet_wrap(~ loc, scales = 'free_x') +
  labs(x = 'Day of year', y = expression('Radiation'~(W/m^'-2')), 
       colour = 'Position (from surface)') +
  theme(legend.position = 'top')
ggsave('../plots/rad_date.png', height = 6, width = 8)

# Air temperature
ggplot(wthr, aes(doy, air_temp)) +
  geom_line(colour = 'skyblue') +
  facet_wrap(~ loc, scales = 'free_x') +
  labs(x = 'Day of year', y = 'Air temperature (deg. C)',
       colour = 'Position (from surface)') +
  theme(legend.position = 'top')
ggsave('../plots/air_temp_date.png', height = 6, width = 8)

# Soil temperatures
ggplot(mod, aes(doy, wall_temp)) +
  geom_line(colour = 'orange') +
  geom_line(aes(y = floor_temp), colour = 'red') +
  geom_line(aes(y = air_temp), colour = 'skyblue') +
  geom_line(aes(y = (air_temp + 2)), colour = 'brown') +
  facet_wrap(~ site, scales = 'free_x') +
  labs(x = 'Day of year', y = expression('Soil temperature'~(degree*C)), 
       colour = 'Position (from surface)') +
  theme(legend.position = 'top')
ggsave('../plots/soil_temp_doy.png', height = 6, width = 8)

# Slurry level
ggplot(mod, aes(doy, slurry_depth)) +
  geom_line() +
  facet_wrap(~ site, scales = 'free_x') +
  labs(x = 'Day of year', y = 'Slurry level (m)') 
ggsave('../plots/slurry_level_doy.png', height = 6, width = 8)


