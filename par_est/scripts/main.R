# Parameter estimation for STM by fitting to measurements from Sweden
# Uses 3 locations
# Applies models to these 3 locations + 1 more after parameter estimation

rm(list = ls())

# Set parameter set name
parver <- '0.6'

source('remove.R')
source('packages.R')
source('res_func.R')
source('load_meas.R')
source('cal.R')
source('export.R')
source('run_final.R')
source('load_final.R')
source('plot_final.R')

