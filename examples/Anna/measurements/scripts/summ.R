# Get averages by date and location

ds <- aggregate(dl$temp, dl[, c('slurry', 'date')], mean, na.rm = TRUE)
names(ds)[3] <- 'temp'
