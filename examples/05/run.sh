# Runs simulations and makes plots

# Remove old results
rm stm_output/*.*

sim_start_time="$SECONDS"

# Run all simulations in parallel
./stm large pars/pars.txt pars/user_pars_large.txt weather/weather.csv level/level_large.csv
./stm small pars/pars.txt pars/user_pars_small.txt weather/weather.csv level/level_small.csv

sim_end_time="$SECONDS"

# Move output
mv *_temp.csv* stm_output
mv *_weather* stm_output
mv *_rates* stm_output
mv *_log* stm_output

echo "Model runs took $(($sim_end_time-$sim_start_time)) seconds."
echo "Check the stm_output directory for results."

