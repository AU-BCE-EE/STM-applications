# Get model fit

dl2
summary(dl2)
modfit <- dl2[, .(rmse = rmse(value.meas, value.mod),
                  mbe = mbe(value.meas, value.mod),
                  mae = mae(value.meas, value.mod),
                  me = me(value.meas, value.mod),
                  minerr = min(value.mod - value.meas),
                  maxerr = max(value.mod - value.meas)), by = variable.mod]

modfit <- rounddf(modfit, 3, func = signif)

write.csv(modfit, '../fit/modfit.csv', row.names = FALSE)
