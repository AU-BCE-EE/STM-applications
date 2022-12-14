# Runs simulations and makes plots for example 4

# Remove old results
rm stm_output/*.*
rm plots/*.*

sim_start_time="$SECONDS"

# Run all simulations in parallel
./stm 0.1m pars/pars.txt pars/user_pars01.txt &
./stm 1m pars/pars.txt pars/user_pars1.txt &
./stm 2m pars/pars.txt pars/user_pars2.txt &
./stm 3m pars/pars.txt pars/user_pars3.txt &
./stm 4m pars/pars.txt pars/user_pars4.txt &
./stm 5m pars/pars.txt pars/user_pars5.txt

sim_end_time="$SECONDS"

# Move output
mv *_temp.csv* stm_output
mv *_weather* stm_output
mv *_rates* stm_output
mv *_log* logs 

# Run R scripts to produce plots
cd R_scripts
  Rscript 'main.R'
cd ..

plot_end_time="$SECONDS"

echo "Model runs took $(($sim_end_time-$sim_start_time)) seconds."
echo "Plotting took $(($plot_end_time-$sim_end_time)) seconds."
echo "Check the logs directory for information."

