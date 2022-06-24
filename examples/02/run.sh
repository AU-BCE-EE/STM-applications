# Runs simulations and makes plots

# Remove old results
rm stm_output/*.*

sim_start_time="$SECONDS"

# Run all simulations in parallel
./stm sim1 pars/pars.txt pars/user_pars1.txt &
./stm sim2 pars/pars.txt pars/user_pars2.txt &
./stm sim3 pars/pars.txt pars/user_pars3.txt 
./stm sim4 pars/pars4.txt pars/user_pars1.txt 
./stm sim5 pars/pars5.txt pars/user_pars1.txt 
./stm sim6 pars/pars.txt  pars/user_pars6.txt 

sim_end_time="$SECONDS"

# Move output
mv *_temp.txt* stm_output
mv *_weather* stm_output
mv *_rates* stm_output
mv *_log* stm_output

# Run R scripts

R CMD BATCH --nosave --norestore 'main.R'

rm Rplots.pdf
rm main.Rout
rm .RData

plot_end_time="$SECONDS"

echo "Model runs took $(($sim_end_time-$sim_start_time)) seconds."
echo "Plotting took $(($plot_end_time-$sim_end_time)) seconds."
echo "Check the logs directory for information."

