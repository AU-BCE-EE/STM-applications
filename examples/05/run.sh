# Runs simulations and makes plots

# Remove old results
rm stm_output/*.*
rm plots/*.*

sim_start_time="$SECONDS"

# Run simulation
./stm G pars_plastic.txt user_pars.txt weather.csv

sim_end_time="$SECONDS"

# Move output
mv *_temp.csv* stm_output
mv *_weather* stm_output
mv *_rates* stm_output
mv *_log* logs

# Run R scripts
Rscript 'plot.R'

plot_end_time="$SECONDS"

echo "Model runs took $(($sim_end_time-$sim_start_time)) seconds."
echo "Plotting took $(($plot_end_time-$sim_end_time)) seconds."
echo "Check the logs directory for information."

