# Plot STM results

library(data.table)
library(ggplot2)

dat <- data.table()

for (f in list.files('../stm_output', pattern = 'temp', full.names = TRUE)) {

  d <- fread(f, skip = 2)
  d <- d[day > 365, ]
  d[, scenario := gsub('.+([ABCDEF])_.+', '\\1', f)]
  dat <- rbind(dat, d)

}

pp <- ggplot(dat, aes(doy, slurry_temp, colour = scenario)) +
        geom_line() +
	geom_line(aes(doy, air_temp), colour = 'skyblue', lwd = 2, lty = '1111') +
        geom_label(data = dat[doy == 365, ], aes(label = scenario)) +
        geom_label(data = dat[doy == 1, ], aes(label = scenario)) +
	theme_bw() +
	theme(legend.position = 'none') +
	labs(x = 'Day of year', y = expression('Slurry temperature'~(degree*C)))

ggsave('../plots/size_comp.png', pp, height = 4, width = 5)
