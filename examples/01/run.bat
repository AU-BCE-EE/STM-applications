REM Batch file to run STM simulations and makes plots for example 1
@ECHO OFF

echo "Running STM example 1 . . ."
echo ""

REM Remove old results
del /Q stm_output\*.*

REM Run both simulations
stm.exe Raan pars\pars.txt pars\Raan_u_pars.txt weather\Uppsala_weather.txt level\Raan_level.txt
stm.exe Tjel pars\pars.txt pars\Tjel_u_pars.txt weather\Tjele_weather.txt level\Tjel_level.txt 

REM Move output
move *_temp.csv* stm_output >nul
move *_weather* stm_output >nul
move *_rates* stm_output >nul
move *_log* logs >nul

REM Run R scripts (must have R installed and ENVIRONMENT variable set, along with some packages installed)
cd R_scripts
  Rscript main_plot.R
cd..

echo "Done"
echo ""
echo "Check stm_output directory for output files"
echo "Results are plotted with measurements in plots directory"
echo "See logs directory for information on the model runs"
pause