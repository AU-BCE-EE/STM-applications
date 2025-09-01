# Plot STM results

library(data.table)
library(ggplot2)

dat <- data.table()

for (f in list.files('../stm_output', pattern = 'temp', full.names = TRUE)) {

  d <- fread(f, skip = 2)
  d <- d[day > 365, ]
  d[, sim := gsub('\\.\\.\\/stm_output\\/(.+)_temp\\.csv', '\\1', f)]
  dat <- rbind(dat, d)

}

dat[, sim.nm := factor(sim, levels = c('3042', '640', '642', '220'),
			labels = c('30 x 4 m, 2 m buried', '6 x 4 m', '6 x 4 m, 2 m buried', '2 x 2 m'))]

xbrks <- c(0, 50, 100, 150, 200, 250, 300, 365)

ggplot(dat, aes(doy, slurry_temp, colour = sim.nm)) +
  geom_line() +
  geom_label(data = dat[doy == 365, ], aes(y = slurry_temp + c(0., 0., 0., 0.), label = sim.nm), hjust = 0, size = 2.7) +
  scale_x_continuous(breaks = xbrks, labels = xbrks, limits = c(0, 460)) +  
  labs(x = 'Day of year', y = expression('Average slurry temperature'~(degree*C)), colour = '') +
  theme_bw() +
  theme(legend.position = 'none')
ggsave('../plots/tank_size_comp_STM.png', height = 4, width = 5)
