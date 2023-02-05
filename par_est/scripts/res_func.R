# Define residuals function
# Uses sed utility to change values in copy of parameter template

resCalc <- function(p, meas, fixed){

  # Cheap fix for negative parameter values
  p <- abs(p)
  cat(signif(p, 4), ': ')
  if (!missing(fixed)) {
    p <- c(p, fixed)
  }

  # Write parameter values to file
  system('cp ../pars/pars_template.txt ../pars/pars.txt')
  for (i in 1:length(p)) {
    system(paste0('sed -i s/', names(p)[i], '/', p[i], '/g ../pars/pars.txt'))
  }

  # Run model
  system('./stm A ../pars/pars.txt ../pars/A_user_pars.txt ../weather/Backa_weather.csv ../level/A_level.txt &
          ./stm B ../pars/pars.txt ../pars/B_user_pars.txt ../weather/Uppsala_weather.csv ../level/B_level.txt &
          ./stm D ../pars/pars.txt ../pars/D_user_pars.txt ../weather/Backa_weather.csv ../level/D_level.txt &
          ./stm F ../pars/pars.txt ../pars/F_user_pars.txt ../weather/Ottawa_weather.csv ../level/F_level.csv')

  # Move output
  system('mv *_temp.csv* ../stm_output &
          mv *_weather* ../stm_output &
          mv *_log* ../stm_output &
          mv *_summary* ../stm_output &
          mv *_rates* ../stm_output')

  # Read in calculated temperatures
  mod <- data.frame()
  ff <- list.files('../stm_output', pattern = 'temp.csv')
  for (i in ff) {
    d <- read.csv(paste0('../stm_output/', i), skip = 2, header = TRUE)
    d$site <- substr(i, 1, 1)
    mod <- rbind(mod, d)
  }

  # First measurements start in May (Back, Raan) or April (Fitt) 2020 and end in end of 2021
  mod$year[mod$site != 'F'] <- 2017 + mod$year[mod$site != 'F']
  # So mod$year of 1 (first year of sim) is 2018, giving about 2+ year of startup
  # For Ottawa, first measurements are in August 2015
  mod$year[mod$site == 'F'] <- 2012 + mod$year[mod$site == 'F']
  mod$date <- as.POSIXct(paste(mod$year, mod$doy), format = '%Y %j')

  # Merge measured and calculated
  dat <- merge(meas[, c('site', 'date', 'temp')], mod[, c('site', 'date', 'slurry_temp')], by = c('site', 'date'))
  nddat <<- dat

  res <- dat$slurry_temp - dat$temp
  #obj <- sum(abs(res))
  obj <- sum(res^2)

  #if (obj < 1300) browser()
  cat(signif(obj, 6), '\n')

  return(obj)
}


