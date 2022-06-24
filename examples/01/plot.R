# Very strange that some parts of the temp (meas) lines are not plotted with geom_line()
# Can eliminate by dropping temp == NA

dl$site <- factor(dl$site, levels = c('Raan', 'Tjel'), labels = c('Sweden', 'Denmark'))
dm$site <- factor(dm$site, levels = c('Raan', 'Tjel'), labels = c('Sweden', 'Denmark'))
rl$site <- factor(rl$site, levels = c('Raan', 'Tjel'), labels = c('Sweden', 'Denmark'))

ggplot(dl, aes(doy, value, colour = variable)) +
  geom_path() +
  facet_wrap(~ site) +
  labs(x = 'Day of year', y = expression('Temperature'~(degree*C)), 
       colour = '') +
  theme_bw() +
  scale_color_brewer(palette = 'Dark2') +
  theme(legend.position = 'top')
ggsave('plots/ave_stor_temp_doy.pdf', height = 3, width = 6)

ggplot(dm, aes(doy, temp)) +
  geom_line(aes(doy, temp.floor), colour = 'gray32', lty = 1) +
  geom_line(aes(doy, temp.air), colour = 'skyblue', lty = 1) +
  geom_path(col = 'red') +
  facet_wrap(~ site) +
  labs(x = 'Day of year', y = expression('Temperature'~(degree*C)), 
       colour = 'Position (from surface)') +
  theme_bw() +
  theme(legend.position = 'top')
ggsave('plots/ave_stor_temp_doy_floor.pdf', height = 3, width = 6)

ggplot(dm, aes(doy, depth.slurry)) +
  geom_line() +
  facet_wrap(~ site) +
  labs(x = 'Date', y = 'Slurry depth (m)', 
       colour = 'Position (from surface)') +
  theme_bw() +
  theme(legend.position = 'top')
ggsave('plots/slurry_depth_doy.pdf', height = 3, width = 6)

ggplot(rl, aes(doy, value/1000, colour = variable)) +
  geom_line(alpha = 0.7) +
  facet_wrap(~ site, scales = 'free') +
  labs(x = 'Day of year', y = expression('Heat flow out'~(kW)), colour = '') +
  scale_color_brewer(palette = 'Dark2') +
  theme_bw() +
  theme(legend.position = 'top') 
ggsave('plots/heat_flow.pdf', height = 3, width = 6)


rl2 <- melt(rates, id.vars = c('dos', 'doy', 'year', 'site', 'Total'), measure.vars = c('Radiation', 'Generation', 'Air', 'Floor', 'Lower wall', 'Upper wall'))
rl2$qrel <- rl2$value / rl2$Total
rl2$site <- factor(rl2$site, levels = c('Raan', 'Tjel'), labels = c('Sweden', 'Denmark'))

ggplot(rl2, aes(doy, qrel, colour = variable)) +
  geom_line() +
  facet_wrap(~ site, scales = 'free') +
  labs(x = 'Day of year', y = expression('Heat flow out'~(kW))) +
  theme(legend.position = 'top') +
  theme_bw()
ggsave('plots/heat_flow_rel.pdf', height = 3, width = 6)


