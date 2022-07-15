# STM-applications example 1
Calculation of stored slurry temperature for a single site with detailed weather and slurry level inputs.
This README file explains how to run (and modify) the simulations in example 1.

# Windows
1. Open Command Prompt (e.g., hit Windows key, type `command prompt` and select the app option that appears) and navigate to the folder that holds this README file.
2. Enter the following command in your Command Prompt window: `stm.exe Ex01 pars.txt user_pars.txt weather.txt level.txt`.
3. Check the working directory for output files. `Ex01_temp.csv` has the predicted temperature values and can be opened in any spreadsheet program or text editor. Data could be plotted using R, Pythong, Excel, or similar programs. Make sure the file `Ex01_log.txt` confirms that the correct input files were used.
4. Make some tweaks and see what happens. Storage dimensions or managment can be changed in `user_pars.txt`. The slurry level and weather files could be changed as well (but see example 2 for an easier approach).

# Linux
Run `stm` in a shell with the following command: `./stm Ex01 pars.txt user_pars.txt weather.txt level.txt`. Output files will be in the working directory. 

