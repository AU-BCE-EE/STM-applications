
# Measurements
dat <- read.csv('../meas_temp/Sweden_storage_temp.csv')
dat$date.time <- ymd_hm(dat$date.time)
dat$date <- as.POSIXct(substr(dat$date.time, 1, 10))
dat$depth <- paste(dat$depth, ' m')

# Fix site
dat$site <- substr(dat$site, 1, 4)
dat$site[dat$site == 'Rånä'] <- 'Raan'

# Subset to only Raan
dat <- subset(dat, site == 'Raan')

# Average measured temperature
dm <- aggregate(temp ~ site + date, data = dat, FUN = mean)

# Tjele data
ddt <- read.csv('meas_temp/Tjele_storage_temp.csv')
ddt$date.time <- ymd_hm(ddt$date.time)
ddt$date <- as.POSIXct(substr(ddt$date.time, 1, 10))
dmt <- aggregate(temp ~ site + date, data = ddt, FUN = mean)

dm <- rbind(dm, dmt)

dat <- rbind(dat, ddt)
# NTS: name problems with height!

# Model results
mod <- data.frame()
ff <- list.files('stm_output', pattern = 'temp.txt')
for (i in ff) {
  d <- read.table(paste0('stm_output/', i), skip = 2, header = TRUE)
  names(d) <- c('dos', 'doy', 'year', 'mass.slurry', 'mass.frozen', 
                'depth.slurry', 'temp.air', 'temp.wall', 'temp.floor', 
                'temp.slurry')
  d$site <- substr(i, 1, 4)
  mod <- rbind(mod, d)
}

mod$year <- 2018 + mod$year
mod$date <- as.POSIXct(paste(mod$year, mod$doy), format = '%Y %j')
# Drop start-up year
mod <- subset(mod, year > 2019)
