

for (i in unique(dat$sim)) {
  dd <- subset(dat, sim == i)
  temp_C <- data.frame(time = dd$doy, temp_C = dd$temp.slurry)
  temp_C <- rbind(temp_C, temp_C)
  slurry_mass <- data.frame(time = dd$doy, slurry_mass = dd$mass.slurry * 1000)
  slurry_mass <- rbind(slurry_mass, slurry_mass)
  temp_C$time <- slurry_mass$time <- 1:nrow(temp_C)
  out <- abm(2*365, mng_pars = list(slurry_mass = slurry_mass, area = 1018, temp_C = temp_C), startup = 365)
  dat[dat$sim == i, 'CH4_emis_rate'] <- out$CH4_emis_rate[1:365]
}
