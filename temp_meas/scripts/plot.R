
ggplot(dat.all, aes(date.time, temp, colour = factor(depth))) +
  geom_line() +
  facet_wrap(~ site) +
  labs(x = 'Date/time', y = expression('Slurry temperature'~(degree*C)), colour = 'Depth (m)') +
  theme(legend.position = c(0.8, 0.3))
ggsave('../plots/temp_all.png', height = 6, width = 8)

ggplot(dat.mean, aes(doy, temp, colour = site)) +
  geom_line(alpha = 0.3) +
  geom_point(shape = 1, size = 0.2) +
  facet_wrap(~ site, scales = 'free_x') +
  labs(x = 'Date', y = expression('Slurry temperature'~(degree*C)), colour = 'Depth (m)') +
  theme(legend.position = 'top')
ggsave('../plots/temp_mean.png', height = 6, width = 8)
