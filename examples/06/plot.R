# Plot measured and STM temperatures

library(ggplot2)

head(meas)

meas <- read.csv('measured_slurry_temp.csv')
nh <- read.csv('noheat_temp.csv', skip = 2)
c10 <- read.csv('constant10_temp.csv', skip = 2)
c25 <- read.csv('constant25_temp.csv', skip = 2)

meas$date <- as.POSIXct(paste(meas$year, meas$doy), format = '%Y %j')

nh$variable <- 'STM no heat'
c10$variable <- 'STM 10C'
c25$variable <- 'STM 25C'

mod <- rbind(nh, c10, c25)
mod$Type <- 'STM'

mod$year <- mod$year + 2012
mod$date <- as.POSIXct(paste(mod$year, mod$doy), format = '%Y %j')

mod <- subset(mod, date >= min(meas$date) & date <= max(meas$date))

meas$variable = 'Measured slurry'
meas$Type <- 'Measured'

head(meas)

mod$value <- mod$slurry_temp
dl <- rbind(meas[, c('date', 'doy', 'variable', 'value', 'Type')], mod[, c('date', 'doy', 'variable', 'value', 'Type')]) 
#mod$variable = 'Air'
#mod$value <- mod$air_temp
#dl <- rbind(dl, mod[, c('date', 'doy', 'variable', 'value')]) 

dl$variable <- factor(dl$variable, levels = c('Measured slurry', 'STM no heat', 'STM 10C', 'STM 25C'))

ggplot(dl, aes(doy, value, colour = variable)) +
  geom_line(aes(lty = Type)) +
  labs(x = 'Day of year', y = expression('Slurry temperature'~(degree*C)), 
       colour = '', lty = '') +
  theme_bw() +
  scale_color_brewer(palette = 'Dark2') +
  theme(legend.position = 'right')
ggsave('plots/ex6_ave_stor_temp_doy.pdf', height = 3, width = 5)

ggplot(dl, aes(date, value, colour = variable)) +
  geom_line(aes(lty = Type)) +
  labs(x = 'Date', y = expression('Slutty temperature'~(degree*C)), 
       colour = '', lty = '') +
  theme_bw() +
  scale_color_brewer(palette = 'Dark2') +
  theme(legend.position = 'right')
ggsave('plots/ex6_ave_stor_temp_date.pdf', height = 3, width = 5)

ggplot(mod, aes(date, slurry_depth)) +
  geom_line(aes(lty = Type)) +
  labs(x = 'Date of year', y = 'Level (m)') +
  theme_bw() +
  scale_color_brewer(palette = 'Dark2') +
  theme(legend.position = 'right')
ggsave('plots/ex6_level_date.pdf', height = 3, width = 5)
