# Parameter estimation for STM by fitting to measurements from Sweden
# Uses 3 locations
# Applies models to these 3 locations + 3 more after parameter estimation

rm(list = ls())

# Set parameter set name
parver <- '0.13'

source('remove.R')
source('packages.R')
source('functions.R')
source('copy_weather.R')
source('copy_level.R')
source('load_meas.R')
source('cal.R')
source('export.R')
source('run_final.R')
source('load_final.R')
source('fit.R')
source('plot_final.R')

