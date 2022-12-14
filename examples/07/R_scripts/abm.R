# Run ABM model and add output to main data frame for plotting

for (i in unique(dat$sim)) {
  dd <- subset(dat, sim == i)
  temp_C <- data.frame(time = dd$doy, temp_C = dd$temp.slurry)
  temp_C <- rbind(temp_C, temp_C)
  slurry_mass <- data.frame(time = dd$doy, slurry_mass = dd$mass.slurry * 1000)
  slurry_mass <- rbind(slurry_mass, slurry_mass)
  temp_C$time <- slurry_mass$time <- 1:nrow(temp_C)
  out <- abm(2*365, mng_pars = list(slurry_mass = slurry_mass, area = 1018, temp_C = temp_C), startup = 365)
  # Remove duplicate times from emptying events
  out <- out[!duplicated(out$time), ]
  dat[dat$sim == i, 'CH4_emis_rate'] <- out$CH4_emis_rate
  dat[dat$sim == i, 'CH4_emis_cum'] <- out$CH4_emis_cum - out$CH4_emis_cum[1]
}

dat.cum <- dat[dat$doy == 365, c('sim', 'date', 'mass.slurry', 'CH4_emis_cum')]
dat.cum$CH4_emis_cum_Mg <- dat.cum$CH4_emis_cum / 1E6
