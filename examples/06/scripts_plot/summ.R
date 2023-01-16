# Fit statistics for reviewers

d <- meas[, c('year', 'doy', 'value')]
d$slurry_temp_meas <- d$value
d$value <- NULL

mod$slurry_temp_mod <- mod$value

meas.mod <- merge(mod, d, by = c('year', 'doy'))
meas.mod <- subset(meas.mod, !is.na(slurry_temp_meas))

meas.mod$diff <- meas.mod$slurry_temp_mod - meas.mod$slurry_temp_meas

rmse <- function(x) sqrt(mean(x^2))

summ <- aggregate2(meas.mod, 'diff', 'variable', FUN = c(mean = mean, rmse = rmse, min = min, max = max))
