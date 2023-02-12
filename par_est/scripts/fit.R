# Get model fit

modfit <- dat[, .(rmse = rmse(slurry_temp_meas, slurry_temp_mod),
                  mbe = mbe(slurry_temp_meas, slurry_temp_mod),
                  mae = mae(slurry_temp_meas, slurry_temp_mod),
                  me = me(slurry_temp_meas, slurry_temp_mod),
                  minerr = min(slurry_temp_mod - slurry_temp_meas),
                  maxerr = max(slurry_temp_mod - slurry_temp_meas)), by = site]

modfit <- rounddf(modfit, 3, func = signif)

write.csv(modfit, '../fit/modfit.csv', row.names = FALSE)
