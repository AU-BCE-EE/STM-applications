
# Model results
dat <- data.frame()
ff <- list.files('../stm_output', pattern = 'temp.csv')
for (i in ff) {
  d <- read.csv(paste0('../stm_output/', i), skip = 2)
  names(d) <- c('dos', 'doy', 'year', 'mass.slurry', 'mass.frozen', 
                'depth.slurry', 'temp.air', 'temp.wall', 'temp.floor', 
                'temp.slurry')
  d$sim <- gsub(' ', '', substr(i, 1, 4))
  dat <- rbind(dat, d)
}

dat$year <- 2018 + dat$year
dat$date <- as.POSIXct(paste(dat$year, dat$doy), format = '%Y %j')
# Drop start-up year
dat <- subset(dat, year == 2021)
