REM  Runs simulations and makes plots for example 4
@ECHO OFF

echo "Running STM example 4 . . ."
echo ""

REM Remove old results
del \Q stm_output\*.*

REM Run all simulations
stm.exe Ref. pars\pars.txt pars\user_pars1.txt
stm.exe Ottawa pars\pars.txt pars\user_pars3.txt
stm.exe Absorp. pars\pars4.txt pars\user_pars1.txt
stm.exe Heat pars\pars5.txt pars\user_pars1.txt
stm.exe Empty2x pars\pars.txt pars\user_pars6.txt
stm.exe Duplin pars\pars.txt pars\user_pars7.txt 
stm.exe Above pars\pars.txt pars\user_pars8.txt 
stm.exe Small pars\pars.txt pars\user_pars9.txt 
stm.exe Buried pars\pars.txt pars\user_pars2.txt 

REM Move output
move *_temp.csv* stm_output >nul
move *_weather* stm_output >nul
move *_rates* stm_output >nul
move *_log* logs >nul

REM Run R scripts to produce plots (must have R installed and PATH variable set, along with some packages installed)
cd R_scripts
  Rscript main.R
cd..

echo "Done"
echo ""
echo "Check stm_output directory for output files"
echo "Results are plotted with measurements in plots directory"
echo "See logs directory for information on the model runs"
pause
