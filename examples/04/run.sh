# Runs simulations and makes plots

# Remove old results
rm stm_output/*.*

sim_start_time="$SECONDS"

# Run all simulations in parallel
../../../STM/bin/stm Ref. pars/pars.txt pars/user_pars1.txt &
../../../STM/bin/stm Bur. pars/pars.txt pars/user_pars2.txt &
../../../STM/bin/stm Ott. pars/pars.txt pars/user_pars3.txt &
../../../STM/bin/stm Abs. pars/pars4.txt pars/user_pars1.txt &
../../../STM/bin/stm Heat pars/pars5.txt pars/user_pars1.txt &
../../../STM/bin/stm Emp. pars/pars.txt pars/user_pars6.txt 
../../../STM/bin/stm Dup.  pars/pars.txt pars/user_pars7.txt 

sim_end_time="$SECONDS"

# Move output
mv *_temp.csv* stm_output
mv *_weather* stm_output
mv *_rates* stm_output
mv *_log* logs 

# Run R scripts

R CMD BATCH --nosave --norestore 'main_plot.R'

rm Rplots.pdf
rm main_plot.Rout
rm .RData

plot_end_time="$SECONDS"

echo "Model runs took $(($sim_end_time-$sim_start_time)) seconds."
echo "Plotting took $(($plot_end_time-$sim_end_time)) seconds."
echo "Check the logs directory for information."

