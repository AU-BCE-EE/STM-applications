
meas <- read.csv('../data_meas/measured_slurry_temp.csv')

# Model results
mod <- data.frame()
ff <- list.files('../stm_output', pattern = 'temp.csv')
for (i in ff) {
  d <- read.csv(paste0('../stm_output/', i), skip = 2)
  d$variable <- gsub('_temp\\.csv', '', i)
  mod <- rbind(mod, d)
}

ff <- list.files('../stm_output', pattern = 'weather.csv')
wthr <- read.csv(paste0('../stm_output/', ff[1]), skip = 2)
