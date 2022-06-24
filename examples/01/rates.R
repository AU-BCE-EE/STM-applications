
# Rates
rates <- data.frame()
ff <- list.files('stm_output', pattern = 'rates.txt')
for (i in ff) {
  d <- read.table(paste0('stm_output/', i), skip = 2, header = FALSE)
  names(d) <- c('dos', 'doy', 'year', 'Radiation', 'Generation', 'Air', 'Floor', 'Lower wall',
		'Upper wall', 'feed', 'Total', 'totave', 'hh', 'hhave', 'hadj', 
		'hadjave', 'sst', 'ss')
  d$site <- substr(i, 1, 4)
  rates <- rbind(rates, d)
}

rl <- melt(rates, id.vars = c('dos', 'doy', 'year', 'site'), 
	   measure.vars = c('Radiation', 'Air', 'Floor', 'Lower wall', 'Upper wall', 'Total'))

rl$variable <- factor(rl$variable, levels = c('Total', 'Air', 'Radiation', 'Upper wall', 'Lower wall', 'Floor'))
