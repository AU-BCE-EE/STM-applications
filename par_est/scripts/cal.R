# Parameter estimation

# Initial par guesses
fixed <- c(heatGen = 0, Rconc = 0.3, Rair = 0.02)
p <- c(Rslur = 0.7, Rsoil = 0.6, absorp = 0.02, soilDamp = 3.3)

# Finally, parameter estimation
m <- optim(par = p, fn = function(par) resCalc(p = par, meas = meas, fixed = fixed), method = 'Nelder-Mead')

sink('../logs/optim_log.txt')
  print(m)
sink()




