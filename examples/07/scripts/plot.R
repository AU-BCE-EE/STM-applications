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
	geom_line(aes(doy, air_temp), colour = 'skyblue', width = 2, lty = 3) +
	theme_bw() +
	labs(x = 'Day of year', y = expression('Slurry temperature'~(degree*C)))

ggsave('../plots/size_comp.png', pp, height = 4, width = 5)
