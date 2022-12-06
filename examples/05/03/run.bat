REM Batch file to run STM simulations and makes plots for example 1
@ECHO OFF

echo "Running STM example 3 . . ."
echo ""

REM Remove old results
del /Q stm_output\*.*

REM Run both simulations
stm.exe C pars\pars.txt pars\C_user_pars.txt weather\Backa_weather.csv level\C_level.txt
stm.exe E pars\pars.txt pars\E_user_pars.txt weather\Tjele_weather.txt level\E_level.txt 

REM Move output
move *_temp.csv* stm_output >nul
move *_weather* stm_output >nul
move *_rates* stm_output >nul
move *_log* logs >nul

REM Run R scripts (must have R installed and PATH variable set, along with some packages installed)
cd R_scripts
  Rscript main_plot.R
cd..

echo "Done"
echo ""
echo "Check stm_output directory for output files"
echo "Results are plotted with measurements in plots directory"
echo "See logs directory for information on the model runs"
pause