
dat$date <- date(dat$date)
dat$sim <- relevel(factor(dat$sim), ref = 'Ref.')
d <- subset(dat, !sim %in% c('Ott.', 'Dup.'))

ggplot(d, aes(date, temp.slurry, colour = factor(sim))) +
  geom_line(data = subset(dat, sim == 'Ref.'), aes(y = temp.air), colour = 'skyblue', alpha = 0.7, lty = 2) +
  geom_line() +
  labs(x = 'Date (month)', y = expression('Temperature'~(degree*C)), 
       colour = '') +
  theme_bw() +
  scale_color_brewer(palette = 'Dark2') +
  scale_x_date(date_breaks = "1 month", date_labels =  "%m") +
  theme(legend.position = 'top') +
  guides(colour = guide_legend(nrow = 2))
ggsave('../plots/ave_stor_temp_date.pdf', height = 2.68, width = 3)

d <- subset(dat, sim %in% c('Ref.', 'Ott.', 'Dup.'))
ggplot(d, aes(date, temp.slurry, colour = factor(sim))) +
  geom_line(aes(y = temp.air), alpha = 0.4, lty = '2121') +
  geom_line() +
  labs(x = 'Date (month)', y = expression('Temperature'~(degree*C)), 
       colour = '') +
  theme_bw() +
  scale_color_brewer(palette = 'Dark2') +
  scale_x_date(date_breaks = "1 month", date_labels =  "%m") +
  theme(legend.position = 'top')
ggsave('../plots/ave_stor_temp_date_loc.pdf', height = 3.4, width = 3)


ggplot(dat, aes(date, mass.slurry, colour = factor(sim))) +
  geom_line() +
  labs(x = 'Date (month)', y = expression('Slurry mass'~(kg)), 
       colour = '') +
  theme_bw() +
  scale_color_brewer(palette = 'Dark2') +
  scale_x_date(date_breaks = "1 month", date_labels =  "%m") +
  theme(legend.position = 'top')
ggsave('../plots/slurry_mass_date.pdf', height = 3, width = 3)

dd <- subset(dat, sim %in% c('Ref.', 'Emp.'))
dd$sim <- as.character(dd$sim)
dd$sim[dd$sim == 'Ref.'] <- 'All others'
dd$sim <- factor(dd$sim, levels = c('Emp.', 'All others'))
ggplot(dd, aes(date, depth.slurry, colour = sim, lty = sim)) +
  geom_line() +
  scale_color_brewer(palette = 'Dark2') +
  labs(x = 'Date (month)', y = 'Slurry depth (m)', 
       colour = '', lty = '') +
  scale_x_date(date_breaks = "1 month", date_labels =  "%m") +
  theme_bw() +
  theme(legend.position = 'top')
ggsave('../plots/slurry_depth_date.pdf', height = 2.6, width = 3)


