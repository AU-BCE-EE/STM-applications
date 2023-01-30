# Fit statistic functions

rmse <- function(x, y) sqrt(mean((x - y)^2))

mae <- function(x, y) mean(abs(x - y))

mbe <- function(meas, mod) mean(mod - meas)
