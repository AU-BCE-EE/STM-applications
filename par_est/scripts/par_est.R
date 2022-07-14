# Parameter estimation for STM by fitting to measurements from Sweden
# S. Hafner

rm(list = ls())

library(ggplot2)
library(lubridate)

# Measurements
measd <- read.csv('../meas_temp/temperature.csv')
measd$measde.time <- ymd_hm(measd$date.time)
measd$date <- as.POSIXct(substr(measd$measde.time, 1, 10))
measd$height <- paste(measd$height, ' m')

# Fix site
measd$site <- substr(measd$site, 1, 4)
measd$site[measd$site == 'Rånä'] <- 'Raan'

# Average temperature
meas <- aggregate(temp ~ site + date, data = measd, FUN = mean)
meas4 <- meas

# Use only 3 for calibration
meas <- subset(meas, site %in% c('Back', 'Fitt', 'Raan'))

# Define residuals function
# Uses sed utility to change values in copy of parameter template
resCalc <- function(p, meas.dat, fixed){

  # Cheap fix for negative parameter values
  p <- abs(p)
  if (!missing(fixed)) {
    p <- c(p, fixed)
  }

  # Change name 
  meas <- meas.dat

  # Write parameter values to file
  system('cp ../pars/pars_template.txt ../pars/pars.txt')
  for (i in 1:length(p)) {
    system(paste0('sed -i s/', names(p)[i], '/', p[i], '/g ../pars/pars.txt'))
  }

  # Run model
  cat('. ')
  system('./stm Back ../pars/pars.txt ../pars/Back_u_pars.txt ../weather/weather.txt ../level/Back_level.txt &
          ./stm Fitt ../pars/pars.txt ../pars/Fitt_u_pars.txt ../weather/weather.txt ../level/Fitt_level.txt &
          ./stm Raan ../pars/pars.txt ../pars/Raan_u_pars.txt ../weather/weather.txt ../level/Raan_level.txt
         ')

  # Move output
  system('mv *_temp.csv* ../stm_output')
  system('mv *_weather* ../stm_output')
  system('mv *_rates* ../stm_output')

  # Read in calculated temperatures
  mod <- data.frame()
  ff <- list.files('../stm_output', pattern = 'temp.csv')
  for (i in ff) {
    d <- read.csv(paste0('../stm_output/', i), skip = 2, header = TRUE)
    names(d) <- c('day', 'doy', 'year', 'slurry_mass', 'frozen_mass', 
                  'slurry_depth', 'air_temp', 'wall_temp', 'floor_temp', 
                  'slurry_temp')
    d$site <- substr(i, 1, 4)
    mod <- rbind(mod, d)
  }

  mod$year <- 2019 + mod$year
  mod$date <- as.POSIXct(paste(mod$year, mod$doy), format = '%Y %j')

  # Merge measured and calculated
  dat <- merge(meas[, c('site', 'date', 'temp')], mod[, c('site', 'date', 'slurry_temp')], by = c('site', 'date'))
  nddat <<- dat

  res <- dat$slurry_temp - dat$temp
  obj <- sum(abs(res))

  return(obj)
}

# Initial par guesses
fixed <- c(heatGen = 0)
p <- c(Rair = 0.02, Rconc = 0.15, Rslur = 0.7, Rsoil = 1.0, absorp = 0.02, soilDamp = 3)

# Finally, parameter estimation
m <- optim(par = p, fn = function(par) resCalc(p = par, meas.dat = meas, fixed = fixed), method = 'Nelder-Mead')
m

# Round parameters and create a final version of the parameter file
fpars <- signif(c(m$par, fixed), 3)

# Create file
system('cp ../pars/pars_template.txt ../final_pars/pars.txt')
for (i in 1:length(fpars)) {
  system(paste0('sed -i s/', names(fpars)[i], '/', fpars[i], '/g ../final_pars/pars.txt'))
}

# Run with final parameters
system('./stm Back ../final_pars/pars.txt ../pars/Back_u_pars.txt ../weather/weather.txt ../level/Back_level.txt &
        ./stm Fitt ../final_pars/pars.txt ../pars/Fitt_u_pars.txt ../weather/weather.txt ../level/Fitt_level.txt &
        ./stm Raan ../final_pars/pars.txt ../pars/Raan_u_pars.txt ../weather/weather.txt ../level/Raan_level.txt
       ')

# Move output
system('mv *_temp.csv* ../stm_output &
        mv *_weather* ../stm_output &
        mv *_rates* ../stm_output')


