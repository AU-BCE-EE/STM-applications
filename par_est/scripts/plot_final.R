# Plot measured and STM slurry temperatures

ggplot(dat, aes(date, slurry_temp_meas)) +
  geom_line(aes(date, air_temp), colour = 'skyblue', lty = 1) +
  geom_line(aes(date, slurry_temp_mod), colour = 'black') +
  geom_path(col = 'red') +
  facet_wrap(~ site.full) +
  labs(x = 'Day of year', y = expression('Temperature'~(degree*C)), 
       colour = 'Position (from surface)') +
  theme(legend.position = 'top')
ggsave('../plots/ave_stor_temp_date.png', height = 6, width = 8)


