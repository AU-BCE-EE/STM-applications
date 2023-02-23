
ggplot(dat.sel, aes(doy, temp)) +
  geom_line(alpha = 0.3) +
  geom_point(shape = 1, size = 0.2) +
  labs(x = 'Date', y = expression('Slurry temperature'~(degree*C)), colour = 'Depth (m)') +
  theme(legend.position = 'top')
ggsave('../plots/temp_mean_H.png', height = 6, width = 8)
