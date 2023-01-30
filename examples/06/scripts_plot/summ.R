# Fit statistics for reviewers

d <- meas[, c('year', 'doy', 'value')]
d$slurry_temp_meas <- d$value
d$value <- NULL

mod$slurry_temp_mod <- mod$value

meas.mod <- merge(mod, d, by = c('year', 'doy'))
meas.mod <- subset(meas.mod, !is.na(slurry_temp_meas))

# Get fit statistics
fitsumm <- meas.mod[, .(rmse = rmse(slurry_temp_meas, slurry_temp_mod),
		        mbe = mbe(meas = slurry_temp_meas, mod = slurry_temp_mod),
		        mae = mae(slurry_temp_meas, slurry_temp_mod),
		        maxabserr = max(abs(slurry_temp_mod - slurry_temp_meas)) 
		        ),
		        by = variable]

fitsumm <- rounddf(as.data.frame(fitsumm), 2)

fr <- data.frame(a = 1, b = 1)
tb <- data.table::data.table(a = 1, b = 1)

v <- 'a'

fr[, v]
tb[, v]
tb[, ..v]
tb[, v, with = FALSE]
fr[, ..v]
fr[, v, with = FALSE]

tb[, ..v]

fr[[v]]
tb[[v]]

tb[1, ..v]

options(datatable.WhenJisSymbolThenCallingScope=FALSE)
options()$datatable.WhenJisSymbolThenCallingScope
tb[, v]

version('data.table')
??version

fr <- data.frame(a = 1:3, b = 1:3)
tb <- data.table::data.table(a = 1:3, b = 1:3)
subset(fr, c(FALSE, TRUE, FALSE), get(v))
data.table:::subset.data.table(tb,  c(FALSE, TRUE, FALSE), get(v))


.subset2(fr, TRUE, get(v))

