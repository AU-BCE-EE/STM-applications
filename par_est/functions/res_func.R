# Define residuals function
# Uses sed utility to change values in copy of parameter template

resCalc <- function(p, meas, fixed){

  # Cheap fix for negative parameter values
  p <- abs(p)
  cat(signif(p, 4), ': ')
  if (!missing(fixed)) {
    p <- signif(c(p, fixed), 5)
  }

  # Write parameter values to file
  system('cp ../pars/pars_template.txt ../pars/pars.txt')
  for (i in 1:length(p)) {
    system(paste0('sed -i s/', names(p)[i], '/', p[i], '/g ../pars/pars.txt'))
  }

  # Remove old output
  system('rm ../stm_output_cal/*.*')

  # Run model
  system('./stm A ../pars/pars.txt ../pars/A_user_pars.txt ../weather/Backa_weather.csv ../slurry_level/A_level.txt &&
          ./stm B ../pars/pars.txt ../pars/B_user_pars.txt ../weather/Uppsala_weather.csv ../slurry_level/B_level.txt &&
          ./stm D ../pars/pars.txt ../pars/D_user_pars.txt ../weather/Backa_weather.csv ../slurry_level/D_level.txt') ##&&

  # Move output
  system('mv *_temp.csv* ../stm_output_cal &&
          mv *_weather.csv* ../stm_output_cal &&
          mv *_log.txt* ../stm_output_cal &&
          mv *_rates.csv* ../stm_output_cal')

  # Read in calculated temperatures
  mod <- data.table()
  ff <- list.files('../stm_output_cal', pattern = 'temp.csv')
  for (i in ff) {
    d <- fread(paste0('../stm_output_cal/', i), skip = 2, header = TRUE)
    d$site <- substr(i, 1, 1)
    mod <- rbind(mod, d)
  }

  # First measurements start in May (Back, Raan) or April (Fitt) 2020 and end in end of 2021
  mod$year <- 2017 + mod$year
  # So mod$year of 1 (first year of sim) is 2018, giving about 2+ year of startup
  mod$date <- as.POSIXct(paste(mod$year, mod$doy), format = '%Y %j', tz = 'UTC')

  # Merge measured and calculated
  dat <- merge(meas[, c('site', 'date', 'temp')], mod[, c('site', 'date', 'slurry_temp')], by = c('site', 'date'))
  nddat <<- dat

  res <- dat$slurry_temp - dat$temp
  obj <- sum(res^2)
  cat(signif(obj, 6), '\n')

  return(obj)
}


