REM simulations and makes plots
@ECHO OFF

REM Remove old results
del /Q stm_output\*.*

REM Run all simulations in parallel
stm.exe large pars\pars.txt pars\user_pars_large.txt weather\weather.csv level\level_large.csv
stm.exe small pars\pars.txt pars\user_pars_small.txt weather\weather.csv level\level_small.csv

REM Move output
move *_temp.csv* stm_output
move *_weather* stm_output
move *_rates* stm_output
move *_log* stm_output

echo "Check the stm_output directory for results."

