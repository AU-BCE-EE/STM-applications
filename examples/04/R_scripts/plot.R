
dat$sim <- relevel(factor(dat$sim), ref = 'Ref.')
d <- subset(dat, !sim %in% c('Ottawa', 'Duplin'))

ggplot(d, aes(doy, temp.slurry, colour = factor(sim))) +
  geom_line(data = subset(dat, sim == 'Ref.'), aes(y = temp.air), colour = 'skyblue', alpha = 0.7, lty = 2) +
  geom_line() +
  labs(x = 'Day of year', y = expression('Temperature'~(degree*C)), 
       colour = '') +
  theme_bw() +
  scale_color_brewer(palette = 'Dark2') +
  theme(legend.position = 'top') +
  guides(colour = guide_legend(nrow = 2))
ggsave2x('../plots/ex4_ave_stor_temp_doy', height = 2.68, width = 5)

dd <- subset(dat, !sim %in% c('Ottawa', 'Duplin', 'Absorp.', 'Heat', 'Buried'))
ggplot(dd, aes(doy, temp.slurry, colour = factor(sim))) +
  geom_line(data = subset(dat, sim == 'Ref.'), aes(y = temp.air), colour = 'skyblue', alpha = 0.7, lty = 2) +
  geom_line() +
  labs(x = 'Day of year', y = expression('Temperature'~(degree*C)), 
       colour = '') +
  theme_bw() +
  theme(legend.position = 'top') +
  scale_color_brewer(palette = 'Dark2') +
  coord_cartesian(ylim = c(0, 20)) +
  guides(colour = guide_legend(nrow = 2))
ggsave2x('../plots/ex4_ave_stor_temp_doy_sel', height = 2.68, width = 3)

ggplot(d, aes(doy, temp.floor, colour = factor(sim))) +
  geom_line(data = subset(dat, sim == 'Ref.'), aes(y = temp.air), colour = 'skyblue', alpha = 0.7, lty = 2) +
  geom_line() +
  labs(x = 'Day of year', y = expression('Temperature'~(degree*C)), 
       colour = '') +
  theme_bw() +
  scale_color_brewer(palette = 'Dark2') +
  theme(legend.position = 'top') +
  guides(colour = guide_legend(nrow = 2))
ggsave2x('../plots/ex4_floor_temp_doy', height = 2.68, width = 5)

ggplot(d, aes(doy, temp.wall, colour = factor(sim))) +
  geom_line(data = subset(dat, sim == 'Ref.'), aes(y = temp.air), colour = 'skyblue', alpha = 0.7, lty = 2) +
  geom_line() +
  labs(x = 'Day of year', y = expression('Temperature'~(degree*C)), 
       colour = '') +
  theme_bw() +
  scale_color_brewer(palette = 'Dark2') +
  theme(legend.position = 'top') +
  guides(colour = guide_legend(nrow = 2))
ggsave2x('../plots/ex4_wall_temp_doy', height = 2.68, width = 5)

dd <- subset(dat, !sim %in% c('Ottawa', 'Duplin'))
ggplot(dat, aes(doy, depth.slurry, colour = factor(sim))) +
  geom_line() +
  labs(x = 'Day of year', y = expression('Slurry depth'~(m)), 
       colour = '') +
  theme_bw() +
  scale_color_brewer(palette = 'Dark2') +
  theme(legend.position = 'top')
ggsave2x('../plots/ex4_slurry_depth_doy_all', height = 3, width = 5)

ggplot(dat, aes(doy, mass.slurry, colour = factor(sim))) +
  geom_line() +
  labs(x = 'Day of year', y = expression('Slurry mass'~(kg)), 
       colour = '') +
  theme_bw() +
  scale_color_brewer(palette = 'Dark2') +
  theme(legend.position = 'top')
ggsave2x('../plots/ex4_slurry_mass_doy', height = 3, width = 5)

dd <- subset(dat, sim %in% c('Ref.', 'Empty2x', 'Small'))
ggplot(dd, aes(doy, depth.slurry, colour = sim, lty = sim)) +
  geom_line() +
  scale_color_brewer(palette = 'Dark2') +
  labs(x = 'Day of year', y = 'Slurry depth (m)', 
       colour = '', lty = '') +
  theme_bw() +
  theme(legend.position = 'top')
ggsave2x('../plots/ex4_slurry_depth_doy', height = 2.6, width = 5)

d <- subset(dat, sim %in% c('Ref.', 'Ottawa', 'Duplin'))
tp <- ggplot(d, aes(doy, temp.slurry, colour = factor(sim))) +
  geom_line(aes(y = temp.air), alpha = 0.4, lty = '1111') +
  geom_line() +
  labs(x = '', y = expression('Temperature'~(degree*C)), 
       colour = '') +
  theme_bw() +
  theme(legend.position = 'top') +
  scale_color_brewer(palette = 'Dark2') 
ggsave2x('../plots/ex4_ave_stor_temp_doy_loc', tp, height = 3.4, width = 3)

d <- subset(dat, sim %in% c('Ref.', 'Ottawa', 'Duplin'))
mp <- ggplot(d, aes(doy, CH4_emis_rate/1000, colour = factor(sim))) +
  geom_line() +
  labs(x = 'Day of year', y = expression(CH[4]~'emission'~(kg~d^'-1')), 
       colour = '') +
  theme_bw() +
  scale_color_brewer(palette = 'Dark2') 
ggsave2x('../plots/ex4_abm_CH4_doy_loc', mp, height = 3.4, width = 3)

mat <- matrix(c(1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
                2, 2, 2, 2, 2, 2, 2, 2), ncol = 1)
cp <- grid.arrange(tp, mp, layout_matrix = mat)
ggsave2x('../plots/ex4_temp_CH4_rate_doy_loc', cp, height = 5, width = 3)

d <- subset(dat, sim %in% c('Ref.', 'Ottawa', 'Duplin'))
cmp <- ggplot(d, aes(doy, CH4_emis_cum/1E6, colour = factor(sim))) +
  geom_line() +
  labs(x = 'Day of year', y = expression(CH[4]~'emission'~(Mg)), 
       colour = '') +
  theme_bw() +
  theme(legend.position = 'none') + 
  scale_color_brewer(palette = 'Dark2') 
ggsave2x('../plots/ex4_abm_CH4_cum_doy_loc', cmp, height = 3.4, width = 3)

mat <- matrix(c(1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
                2, 2, 2, 2, 2, 2, 2, 2), ncol = 1)
cp <- grid.arrange(tp, cmp, layout_matrix = mat)
ggsave2x('../plots/ex4_temp_CH4_doy_loc', cp, height = 5, width = 3)

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
