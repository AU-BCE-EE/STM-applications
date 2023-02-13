# Plot measured and STM temperatures

dl1 <- dl1[order(dl1$doy), ]
ggplot(dl1, aes(doy, value, colour = variable, alpha = dl1$variable != 'Measured air')) +
  geom_line() +
  labs(x = 'Day of year', y = expression('Temperature'~(degree*C)), 
       colour = '') +
  theme_bw() +
  scale_color_brewer(palette = 'Dark2') +
  theme(legend.position = 'right') +
  scale_alpha_manual(values = c(0.4, 1)) +
  guides(alpha = 'none') +
  coord_cartesian(ylim = c(-5, 25))
ggsave('../plots/ex5_ave_stor_temp_doy.pdf', height = 2.5, width = 4.5)

ggplot(wthr, aes(doy, rad)) +
  geom_line() +
  labs(x = 'Day of year', y = expression('Solar radiation'~(W/m^'-2')), 
       colour = '', lty = '') +
  theme_bw() +
  scale_color_brewer(palette = 'Dark2') +
  theme(legend.position = 'right')
ggsave('../plots/ex5_rad_doy.pdf', height = 3, width = 5)

ggplot(mod, aes(doy, slurry_depth)) +
  geom_line() +
  labs(x = 'Day of year', y = 'Level (m)') +
  theme_bw() +
  scale_color_brewer(palette = 'Dark2') +
  theme(legend.position = 'right')
ggsave('../plots/ex5_level_doy.pdf', height = 3, width = 5)

ggplot(mod, aes(doy, slurry_mass)) +
  geom_line() +
  labs(x = 'Day of year', y = 'Slurry (t)') +
  theme_bw() +
  scale_color_brewer(palette = 'Dark2') +
  theme(legend.position = 'right')
ggsave('../plots/ex5_slurry_mass_doy.pdf', height = 3, width = 5)
