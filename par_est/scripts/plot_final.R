# Plot measured and STM slurry temperatures

dat$doy <- as.integer(as.character(dat$date, format = '%j'))

ggplot(dat, aes(doy, slurry_temp_meas)) +
  geom_line(aes(doy, air_temp), colour = 'skyblue', lty = 1) +
  geom_line(aes(doy, slurry_temp_mod), colour = 'black') +
  geom_path(col = 'red') +
  facet_wrap(~ site) +
  labs(x = 'Day of year', y = expression('Temperature'~(degree*C)), 
       colour = 'Position (from surface)') +
  theme(legend.position = 'top')
ggsave('../plots/ave_stor_temp_doy.png', height = 6, width = 8)

ggplot(dat, aes(date, slurry_temp_meas)) +
  geom_line(aes(date, air_temp), colour = 'skyblue', lty = 1) +
  geom_line(aes(date, slurry_temp_mod), colour = 'black') +
  geom_path(col = 'red') +
  facet_wrap(~ site, scales = 'free_x') +
  labs(x = 'Day of year', y = expression('Temperature'~(degree*C)), 
       colour = 'Position (from surface)') +
  theme(legend.position = 'top')
ggsave('../plots/ave_stor_temp_date.png', height = 6, width = 8)

ggplot(wthr, aes(doy, rad)) +
  geom_line(colour = 'orange') +
  facet_wrap(~ loc, scales = 'free_x') +
  labs(x = 'Day of year', y = expression('Radiation'~(W/m^'-2')), 
       colour = 'Position (from surface)') +
  theme(legend.position = 'top')
ggsave('../plots/rad_date.png', height = 6, width = 8)
