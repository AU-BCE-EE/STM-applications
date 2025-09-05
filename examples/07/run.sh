# Run STM scenarios and plot results

# Run STM
./stm 20_04_02 pars/pars_tent.txt pars/upars_20_04_02.txt weather/Tjele_weather.csv level/level_4.csv
./stm 06_04_00 pars/pars_tent.txt pars/upars_06_04_00.txt weather/Tjele_weather.csv level/level_4.csv
./stm 06_04_02 pars/pars_tent.txt pars/upars_06_04_02.txt weather/Tjele_weather.csv level/level_4.csv
./stm 02_02_00 pars/pars_tent.txt pars/upars_02_02_00.txt weather/Tjele_weather.csv level/level_2.csv

# Move STM output
mv *_rates.csv stm_output/
mv *_temp.csv stm_output/
mv *_weather.csv stm_output/
mv *_log.txt stm_output/

cd scripts
Rscript plot.R
cd ..
