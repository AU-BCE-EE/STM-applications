
ggplot(dl, aes(date.time, temp, colour = height, lty = pos)) +
  geom_line() +
  facet_wrap(~ slurry) +
  theme_bw() +
  labs(x = 'Date/time', y = expression('Temperature'~(degree*C)), colour = 'Depth location', lty = 'Distance location (from wall)')
ggsave('../plots/temperature_detailed.png', height = 5, width = 7)

ggplot(ds, aes(date, temp, colour = slurry)) +
  geom_line() +
  geom_point() +
  theme_bw() +
  labs(x = 'Date', y = expression('Average temperature'~(degree*C)), colour = 'Slurry type')
ggsave('../plots/temperature_ave.png', height = 5, width = 5)
