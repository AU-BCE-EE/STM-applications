
ggplot(dat, aes(doy, temp.slurry, colour = factor(sim))) +
  geom_line() +
  labs(x = 'Day of year', y = expression('Slurry temperature'~(degree*C)), 
       colour = 'Scenario') +
  theme_bw() +
  scale_color_brewer(palette = 'Dark2') +
  theme(legend.position = 'top')
ggsave('plots/ave_stor_temp_sims.pdf', height = 3, width = 6)
