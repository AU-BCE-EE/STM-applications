# Runs simulations and makes plots for example 4

# Remove old results
rm stm_output/*.*
rm plots/*.*

sim_start_time="$SECONDS"

# Run all simulations in parallel
./stm Reference pars/pars.txt pars/user_pars1.txt &
./stm Buried pars/pars.txt pars/user_pars2.txt &
./stm Ottawa pars/pars.txt pars/user_pars3.txt &
./stm Absorptiv. pars/pars4.txt pars/user_pars1.txt &
./stm Heat pars/pars5.txt pars/user_pars1.txt &
./stm Emptying pars/pars.txt pars/user_pars6.txt &
./stm Duplin pars/pars.txt pars/user_pars7.txt 

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

