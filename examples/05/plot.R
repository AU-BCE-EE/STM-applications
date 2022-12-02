# Plot STM results 

# Plotting package
library(ggplot2)

# Load data
meas <- read.csv('meas_temperature/output/temp_meas_day.csv')
pred <- read.csv('stm_output/G_temp.csv', skip = 2)

# Sort out dates
pred$year <- pred$year + 2020
meas$date <- as.POSIXct(meas$date, format = '%Y-%m-%d')
pred$date <- as.POSIXct(paste(pred$doy, pred$year), format = '%j %Y')

# Plot results
p <- ggplot(meas, aes(date, temp, colour = slurry)) +
  geom_line(data = pred, aes(date, air_temp), colour = 'skyblue', lty = '11') +
  geom_line() +
  geom_line(data = pred, aes(date, slurry_temp), colour = 'black') +
  labs(x = 'Date', y = expression('Temperature'~(degree*C)), colour = 'Tank')
ggsave('plots/small_tank_temp.png', p, height = 5, width = 5)
