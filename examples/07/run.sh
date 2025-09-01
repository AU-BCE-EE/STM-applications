# Run STM scenarios and plot results
#


# Run STM
./stm 3042 pars/pars_tent.txt pars/user_pars_A.txt
./stm 640 pars/pars_tent.txt pars/user_pars_C.txt
./stm 642 pars/pars_tent.txt pars/user_pars_D.txt
./stm 220 pars/pars_tent.txt pars/user_pars_F.txt

# Move STM output
mv *_rates.csv stm_output/
mv *_temp.csv stm_output/
mv *_weather.csv stm_output/
mv *_log.txt stm_output/

cd scripts
Rscript plot.R
cd ..
