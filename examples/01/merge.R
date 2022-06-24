
# Add in model predictions by date
names(dat)
names(mod)
dat <- merge(dat, mod, by = c('site', 'date'), all = TRUE)
dm <- merge(dm, mod, by = c('site', 'date'), all = TRUE)

dm <- dm[order(dm$site, dm$date), ]


