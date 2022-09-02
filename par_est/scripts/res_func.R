# Define residuals function
# Uses sed utility to change values in copy of parameter template

resCalc <- function(p, meas, fixed){

  # Cheap fix for negative parameter values
  p <- abs(p)
  if (!missing(fixed)) {
    p <- c(p, fixed)
  }

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
  system('mv *_log* ../stm_output')
  system('mv *_rates* ../stm_output')

  # Read in calculated temperatures
  mod <- data.frame()
  ff <- list.files('../stm_output', pattern = 'temp.csv')
  for (i in ff) {
    d <- read.csv(paste0('../stm_output/', i), skip = 2, header = TRUE)
    d$site.short <- substr(i, 1, 4)
    mod <- rbind(mod, d)
  }

  # First measurements start in May (Back, Raan) or April (Fitt) 2020
  mod$year <- 2016 + mod$year
  # So mod$year of 1 (first year of sim) is 2017, giving about 3.5 year of startup
  mod$date <- as.POSIXct(paste(mod$year, mod$doy), format = '%Y %j')

  # Merge measured and calculated
  dat <- merge(meas[, c('site.short', 'date', 'temp')], mod[, c('site.short', 'date', 'slurry_temp')], by = c('site.short', 'date'))
  nddat <<- dat

  res <- dat$slurry_temp - dat$temp
  obj <- sum(abs(res))

  return(obj)
}


