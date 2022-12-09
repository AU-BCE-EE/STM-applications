# Parameter estimation

# Initial par guesses
fixed <- c(heatGen = 0, Rconc = 0.3, Rair = 0.02, soilDamp = 2)
p <- c(Rslur = 0.45, Rsoil = 1.2, absorp = 0.020)

lower <- c(Rslur = 0.01, Rsoil = 0.01, absorp = 0.0)
upper <- c(Rslur = 10, Rsoil = 10, absorp = 0.5)

resCalc(p = p, meas = meas, fixed = fixed)

# Finally, parameter estimation
m <- optim(par = p, fn = function(par) resCalc(p = par, meas = meas, fixed = fixed), method = 'L-BFGS-B', lower = lower, upper = upper)

sink('../logs/optim_log.txt')
  print(m)
sink()




