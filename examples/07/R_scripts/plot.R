
dat$date <- date(dat$date)
dat$sim <- relevel(factor(dat$sim), ref = '0.1m')

ggplot(dat, aes(date, temp.slurry, colour = factor(sim))) +
  geom_line(data = subset(dat, sim == '1m'), aes(y = temp.air), colour = 'skyblue', alpha = 0.7, lty = 2) +
  geom_line() +
  labs(x = 'Date (month)', y = expression('Temperature'~(degree*C)), 
       colour = '') +
  theme_bw() +
  scale_color_brewer(palette = 'Dark2') +
  scale_x_date(date_breaks = "1 month", date_labels =  "%m") +
  theme(legend.position = 'top') +
  guides(colour = guide_legend(nrow = 2))
ggsave2x('../plots/ex6_ave_stor_temp_date', height = 2.68, width = 5)
