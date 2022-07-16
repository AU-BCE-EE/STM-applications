# Parameter estimation

# Initial par guesses
fixed <- c(heatGen = 0)
p <- c(Rair = 0.02, Rconc = 0.15, Rslur = 0.7, Rsoil = 1.0, absorp = 0.02, soilDamp = 3)

# Finally, parameter estimation
m <- optim(par = p, fn = function(par) resCalc(p = par, meas = meas, fixed = fixed), method = 'Nelder-Mead')
m


