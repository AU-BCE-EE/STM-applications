# Runs simulations and makes plots

# Remove old results

# Run all simulations in parallel
./stm noheat pars.txt user_pars_noheat.txt weather.csv level.csv &
./stm constant10 pars.txt user_pars_constant10.txt weather.csv level.csv &
./stm constant25 pars.txt user_pars_constant25.txt weather.csv level.csv 

Rscript 'plot.R'
