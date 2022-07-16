
ggplot(dat.all, aes(date.time, temp, colour = factor(depth))) +
  geom_line() +
  facet_wrap(~ site) +
  labs(x = 'Date/time', y = expression('Slurry temperature'~(degree*C)), colour = 'Depth (m)') +
  theme(legend.position = c(0.8, 0.3))
ggsave('../plots/temp_all.pdf', height = 6, width = 8)
