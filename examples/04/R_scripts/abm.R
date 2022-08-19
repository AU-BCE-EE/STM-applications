

for (i in unique(dat$sim)) {
  dd <- subset(dat, sim == i)
  temp_C <- data.frame(time = dd$doy, temp_C = dd$temp.slurry)
  temp_C2 <- temp_C
  temp_C2$time = temp_C2$time + 365
  temp_C <- rbind(temp_C, temp_C2)
  slurry_mass <- data.frame(time = dd$doy, slurry_mass = dd$mass.slurry * 1000)
  slurry_mass2 <- slurry_mass
  slurry_mass2$time = slurry_mass2$time + 365
  slurry_mass <- rbind(slurry_mass, slurry_mass2)
  out <- abm(730, mng_pars = list(slurry_mass = slurry_mass, area = 1018, temp_C = temp_C), startup = 365)
  dat[dat$sim == i, 'CH4_emis_rate'] <- out$CH4_emis_rate[1:365]
}
