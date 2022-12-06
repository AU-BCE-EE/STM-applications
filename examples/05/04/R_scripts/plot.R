
dat$date <- date(dat$date)
dat$sim <- relevel(factor(dat$sim), ref = 'Ref.')
d <- subset(dat, !sim %in% c('Ottawa', 'Duplin'))

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
ggsave2x('../plots/ex4_ave_stor_temp_date', height = 2.68, width = 5)

dd <- subset(dat, !sim %in% c('Ottawa', 'Duplin', 'Absorp.', 'Heat', 'Buried'))
ggplot(dd, aes(date, temp.slurry, colour = factor(sim))) +
  geom_line(data = subset(dat, sim == 'Ref.'), aes(y = temp.air), colour = 'skyblue', alpha = 0.7, lty = 2) +
  geom_line() +
  labs(x = 'Date (month)', y = expression('Temperature'~(degree*C)), 
       colour = '') +
  theme_bw() +
  scale_color_brewer(palette = 'Dark2') +
  scale_x_date(date_breaks = "1 month", date_labels =  "%m") +
  theme(legend.position = 'top', axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1)) +
  coord_cartesian(ylim = c(0, 20)) +
  guides(colour = guide_legend(nrow = 2))
ggsave2x('../plots/ex4_ave_stor_temp_date_sel', height = 2.68, width = 3)

ggplot(d, aes(date, temp.floor, colour = factor(sim))) +
  geom_line(data = subset(dat, sim == 'Ref.'), aes(y = temp.air), colour = 'skyblue', alpha = 0.7, lty = 2) +
  geom_line() +
  labs(x = 'Date (month)', y = expression('Temperature'~(degree*C)), 
       colour = '') +
  theme_bw() +
  scale_color_brewer(palette = 'Dark2') +
  scale_x_date(date_breaks = "1 month", date_labels =  "%m") +
  theme(legend.position = 'top') +
  guides(colour = guide_legend(nrow = 2))
ggsave2x('../plots/ex4_floor_temp_date', height = 2.68, width = 5)

ggplot(d, aes(date, temp.wall, colour = factor(sim))) +
  geom_line(data = subset(dat, sim == 'Ref.'), aes(y = temp.air), colour = 'skyblue', alpha = 0.7, lty = 2) +
  geom_line() +
  labs(x = 'Date (month)', y = expression('Temperature'~(degree*C)), 
       colour = '') +
  theme_bw() +
  scale_color_brewer(palette = 'Dark2') +
  scale_x_date(date_breaks = "1 month", date_labels =  "%m") +
  theme(legend.position = 'top') +
  guides(colour = guide_legend(nrow = 2))
ggsave2x('../plots/ex4_wall_temp_date', height = 2.68, width = 5)

dd <- subset(dat, !sim %in% c('Ottawa', 'Duplin'))
ggplot(dat, aes(date, depth.slurry, colour = factor(sim))) +
  geom_line() +
  labs(x = 'Date (month)', y = expression('Slurry depth'~(m)), 
       colour = '') +
  theme_bw() +
  scale_color_brewer(palette = 'Dark2') +
  scale_x_date(date_breaks = "1 month", date_labels =  "%m") +
  theme(legend.position = 'top')
ggsave2x('../plots/ex4_slurry_depth_date_all', height = 3, width = 5)

ggplot(dat, aes(date, mass.slurry, colour = factor(sim))) +
  geom_line() +
  labs(x = 'Date (month)', y = expression('Slurry mass'~(kg)), 
       colour = '') +
  theme_bw() +
  scale_color_brewer(palette = 'Dark2') +
  scale_x_date(date_breaks = "1 month", date_labels =  "%m") +
  theme(legend.position = 'top')
ggsave2x('../plots/ex4_slurry_mass_date', height = 3, width = 5)

dd <- subset(dat, sim %in% c('Ref.', 'Empty2x', 'Small'))
ggplot(dd, aes(date, depth.slurry, colour = sim, lty = sim)) +
  geom_line() +
  scale_color_brewer(palette = 'Dark2') +
  labs(x = 'Date (month)', y = 'Slurry depth (m)', 
       colour = '', lty = '') +
  scale_x_date(date_breaks = "1 month", date_labels =  "%m") +
  theme_bw() +
  theme(legend.position = 'top')
ggsave2x('../plots/ex4_slurry_depth_date', height = 2.6, width = 5)

d <- subset(dat, sim %in% c('Ref.', 'Ottawa', 'Duplin'))
tp <- ggplot(d, aes(date, temp.slurry, colour = factor(sim))) +
  geom_line(aes(y = temp.air), alpha = 0.4, lty = '1111') +
  geom_line() +
  labs(x = '', y = expression('Temperature'~(degree*C)), 
       colour = '') +
  theme_bw() +
  scale_color_brewer(palette = 'Dark2') +
  scale_x_date(date_breaks = "1 month", date_labels =  "%m") +
  theme(legend.position = 'top', axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))
ggsave2x('../plots/ex4_ave_stor_temp_date_loc', tp, height = 3.4, width = 3)

d <- subset(dat, sim %in% c('Ref.', 'Ottawa', 'Duplin'))
mp <- ggplot(d, aes(date, CH4_emis_rate/1000, colour = factor(sim))) +
  geom_line() +
  labs(x = 'Date (month)', y = expression(CH[4]~'emission'~(kg~d^'-1')), 
       colour = '') +
  theme_bw() +
  scale_color_brewer(palette = 'Dark2') +
  scale_x_date(date_breaks = "1 month", date_labels =  "%m") +
  theme(legend.position = 'none', axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))
ggsave2x('../plots/ex4_abm_CH4_date_loc', mp, height = 3.4, width = 3)

mat <- matrix(c(1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
                2, 2, 2, 2, 2, 2, 2, 2), ncol = 1)
cp <- grid.arrange(tp, mp, layout_matrix = mat)
ggsave2x('../plots/ex4_temp_CH4_rate_date_loc', cp, height = 5, width = 3)

d <- subset(dat, sim %in% c('Ref.', 'Ottawa', 'Duplin'))
cmp <- ggplot(d, aes(date, CH4_emis_cum/1E6, colour = factor(sim))) +
  geom_line() +
  labs(x = 'Date (month)', y = expression(CH[4]~'emission'~(Mg)), 
       colour = '') +
  theme_bw() +
  scale_color_brewer(palette = 'Dark2') +
  scale_x_date(date_breaks = "1 month", date_labels =  "%m") +
  theme(legend.position = 'none', axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))
ggsave2x('../plots/ex4_abm_CH4_cum_date_loc', cmp, height = 3.4, width = 3)

mat <- matrix(c(1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
                2, 2, 2, 2, 2, 2, 2, 2), ncol = 1)
cp <- grid.arrange(tp, cmp, layout_matrix = mat)
ggsave2x('../plots/ex4_temp_CH4_date_loc', cp, height = 5, width = 3)

ggplot(rl, aes(doy, value/1000, colour = variable)) +
  geom_line(alpha = 0.7) +
  facet_wrap(~ sim, scales = 'free') +
  labs(x = 'Day of year', y = expression('Heat flow out'~(kW)), colour = '') +
  scale_color_brewer(palette = 'Dark2') +
  theme_bw() +
  theme(legend.position = 'top') 
ggsave2x('../plots/ex4_heat_rates', height = 8.5, width = 11)

ggplot(rl, aes(doy, value.norm, colour = variable)) +
  geom_line(alpha = 0.7) +
  facet_wrap(~ sim, scales = 'fixed') +
  labs(x = 'Day of year', y = expression('Heat flow out'~(W~Mg^'-1')), colour = '') +
  scale_color_brewer(palette = 'Dark2') +
  theme_bw() +
  theme(legend.position = 'top') 
ggsave2x('../plots/ex4_norm_heat_rates', height = 8.5, width = 11)
