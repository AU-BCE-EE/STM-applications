# Runs simulations and makes plots

# Remove old results
rm stm_output/*.*

# Run all simulations in parallel
./stm default pars/pars.txt pars/user_pars_noheat.txt weather/weather.csv level.csv &
./stm constant pars/pars.txt pars/user_pars_constant.txt weather/weather.csv level.csv 

# Move output
mv *_temp.csv* stm_output
mv *_weather* stm_output
mv *_rates* stm_output
mv *_log* logs
mv *_summary* stm_output

cd scripts_plot
  Rscript 'main.R'
cd ..
