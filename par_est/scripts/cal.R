# Parameter estimation

# Initial par guesses
fixed <- c(heatGen = 0.0, Rconc = 0.3, soilConstDepth = 2.0, soilOffset = 2.0, Rair = 0.02)
p <- c(Rslur = 0.45, Rsoil = 1.2, absorp = 0.03)

# Finally, parameter estimation
m <- optim(par = p, fn = function(par) resCalc(p = par, meas = meas, fixed = fixed), method = 'Nelder-Mead')
