# Plot STM results

library(data.table)
library(ggplot2)

dat <- data.table()

# Read in temperature predictions
for (f in list.files('../stm_output', pattern = 'temp', full.names = TRUE)) {

  d <- fread(f, skip = 2)
  d <- d[day > 365, ]
  d[, sim := gsub('\\.\\.\\/stm_output\\/(.+)_temp\\.csv', '\\1', f)]
  dat <- rbind(dat, d)

}

dat[, sim.nm := factor(sim, levels = c('20_04_02', '06_04_00', '06_04_02', '02_02_00'),
			labels = c('20 x 4 m, 2 m buried', '6 x 4 m', '6 x 4 m, 2 m buried', '2 x 2 m'))]

xbrks <- c(0, 50, 100, 150, 200, 250, 300, 365)

ggplot(dat, aes(doy, slurry_temp, colour = sim.nm)) +
  geom_line() +
  geom_label(data = dat[doy == 365, ], aes(y = slurry_temp + c(0., 0., 0., 0.), label = sim.nm), hjust = 0, size = 2.7) +
  scale_x_continuous(breaks = xbrks, labels = xbrks, limits = c(0, 470)) +  
  labs(x = 'Day of year', y = expression('Average slurry temperature'~(degree*C)), colour = '') +
  theme_bw() +
  theme(legend.position = 'none')
ggsave('../plots/size_comp_STM_temp.png', height = 4, width = 5)

ggplot(dat, aes(doy, slurry_depth, colour = sim.nm)) +
  geom_line() +
  geom_label(data = dat[doy == 365, ], aes(y = slurry_depth + c(0., 0., 0., 0.), label = sim.nm), hjust = 0, size = 2.7) +
  scale_x_continuous(breaks = xbrks, labels = xbrks, limits = c(0, 460)) +  
  labs(x = 'Day of year', y = 'Slurry depth (m)', colour = '') +
  theme_bw() +
  theme(legend.position = 'none')
ggsave('../plots/size_comp_STM_level.png', height = 4, width = 5)


ggplot(dat, aes(doy, slurry_mass, colour = sim.nm)) +
  geom_line() +
  geom_label(data = dat[doy == 365, ], aes(y = slurry_mass + c(0., 0., 0., 0.), label = sim.nm), hjust = 0, size = 2.7) +
  scale_x_continuous(breaks = xbrks, labels = xbrks, limits = c(0, 460)) +  
  labs(x = 'Day of year', y = 'Slurry mass (t)', colour = '') +
  theme_bw() +
  theme(legend.position = 'none')
ggsave('../plots/size_comp_STM_mass.png', height = 4, width = 5)

