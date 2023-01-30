# Plot measured and STM temperatures


ggplot(wthr, aes(date, rad)) +
  geom_line() +
  labs(x = 'Day of year', y = expression('Solar radiation'~(W/m^'-2')), 
       colour = '', lty = '') +
  theme_bw() +
  scale_color_brewer(palette = 'Dark2') +
  theme(legend.position = 'right')
ggsave('../plots/ex6_rad_date.pdf', height = 3, width = 5)

ggplot(dl, aes(doy, value, colour = variable)) +
  geom_line(data = wthr, aes(doy, air_temp), col = 'gray85', lwd = 1.5) +
  geom_line(aes(lty = Type)) +
  labs(x = 'Day of year', y = expression('Slurry temperature'~(degree*C)), 
       colour = '', lty = '') +
  theme_bw() +
  coord_cartesian(ylim = c(-10, 30)) +
  scale_color_brewer(palette = 'Dark2') +
  theme(legend.position = 'right')
ggsave('../plots/ex6_ave_stor_temp_doy.pdf', height = 3, width = 5)

ggplot(dl, aes(date, value, colour = variable)) +
  geom_line(data = wthr, aes(date, air_temp), col = 'gray85', lwd = 1.5) +
  geom_line(aes(lty = Type)) +
  labs(x = 'Date', y = expression('Slurry temperature'~(degree*C)), 
       colour = '', lty = '') +
  theme_bw() +
  coord_cartesian(ylim = c(-10, 30)) +
  scale_color_brewer(palette = 'Dark2') +
  theme(legend.position = 'right')
ggsave('../plots/ex6_ave_stor_temp_date.pdf', height = 3, width = 5)

ggplot(mod, aes(date, slurry_depth)) +
  geom_line(aes(lty = Type)) +
  labs(x = 'Date of year', y = 'Level (m)') +
  theme_bw() +
  scale_color_brewer(palette = 'Dark2') +
  theme(legend.position = 'right')
ggsave('../plots/ex6_level_date.pdf', height = 3, width = 5)

ggplot(mod, aes(date, slurry_mass)) +
  geom_line() +
  labs(x = 'Date of year', y = 'Slurry (t)') +
  theme_bw() +
  scale_color_brewer(palette = 'Dark2') +
  theme(legend.position = 'right')
ggsave('../plots/ex6_slurry_mass_date.pdf', height = 3, width = 5)
