# Run STM scenarios and plot results
#


# Run STM
./stm A pars/pars_tent.txt pars/user_pars_A.txt
./stm B pars/pars_tent.txt pars/user_pars_B.txt
./stm C pars/pars_tent.txt pars/user_pars_C.txt
./stm D pars/pars_tent.txt pars/user_pars_D.txt
./stm E pars/pars_conc.txt pars/user_pars_E.txt
./stm F pars/pars_tent.txt pars/user_pars_F.txt

# Move STM output
mv *_rates.csv stm_output/
mv *_temp.csv stm_output/
mv *_weather.csv stm_output/
mv *_log.txt stm_output/

cd scripts
Rscript plot.R
