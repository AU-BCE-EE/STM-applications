
dat$date <- date(dat$date)

ggplot(dat, aes(date, temp.slurry, colour = factor(sim))) +
  geom_line(data = subset(dat, sim == 1), aes(y = temp.air), colour = 'skyblue', alpha = 0.7, lty = 2) +
  geom_line() +
  labs(x = 'Date (month)', y = expression('Temperature'~(degree*C)), 
       colour = 'Simulation:') +
  theme_bw() +
  scale_color_brewer(palette = 'Dark2') +
  scale_x_date(date_breaks = "1 month", date_labels =  "%m") +
  theme(legend.position = 'top')
ggsave('plots/ave_stor_temp_date.pdf', height = 3, width = 3)

ggplot(dat, aes(date, mass.slurry, colour = factor(sim))) +
  geom_line() +
  labs(x = 'Date (month)', y = expression('Slurry mass'~(kg)), 
       colour = 'Simulation:') +
  theme_bw() +
  scale_color_brewer(palette = 'Dark2') +
  scale_x_date(date_breaks = "1 month", date_labels =  "%m") +
  theme(legend.position = 'top')
ggsave('plots/slurry_mass_date.pdf', height = 3, width = 3)

dd <- subset(dat, sim %in% c(1, 6))
dd$sim <- as.character(dd$sim)
dd$sim[dd$sim == 1] <- 'All others'
dd$sim <- factor(dd$sim, levels = c('6', 'All others'))
ggplot(dd, aes(date, depth.slurry, colour = sim, lty = sim)) +
  geom_line() +
  scale_color_brewer(palette = 'Dark2') +
  labs(x = 'Date (month)', y = 'Slurry depth (m)', 
       colour = 'Simulation:', lty = 'Simulation:') +
  scale_x_date(date_breaks = "1 month", date_labels =  "%m") +
  theme_bw() +
  theme(legend.position = 'top')
ggsave('plots/slurry_depth_date.pdf', height = 2.6, width = 3)


