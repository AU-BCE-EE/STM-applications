# Replace missing values in multiple data frame columns with interpolated values

interpm <- function(dat, x, ys, ...) {

  for (i in ys) {
    rout <- which(is.na(dat[, i])) 
    if (length(rout) > 0) {
      dat[rout, i] <- approx(dat[-rout, x], dat[-rout, i], xout = dat[rout, x], ...)$y 
    } 
  }

  return(dat)

}
