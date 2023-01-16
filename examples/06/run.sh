# Runs simulations and makes plots

# Remove old results
rm stm_output/*.*

# Run all simulations in parallel
./stm default pars/pars.txt pars/user_pars_noheat.txt weather/weather.csv level.csv &
./stm more_rad pars/pars_more_rad.txt pars/user_pars_noheat.txt weather/weather.csv level.csv &
./stm heat_gen pars/pars_heat_gen.txt pars/user_pars_noheat.txt weather/weather.csv level.csv &
./stm constant25 pars/pars.txt pars/user_pars_constant25.txt weather/weather.csv level.csv 

# Move output
mv *_temp.csv* stm_output
mv *_weather* stm_output
mv *_rates* stm_output
mv *_log* logs
mv *_summary* stm_output

cd scripts_plot
  Rscript 'main.R'
cd ..
