# STM-applications example 2
Calculation of stored slurry temperature for a single site with simple weather and slurry level inputs.
This README file explains how to run (and modify) the simulations in example 2.

# Windows
1. Open Command Prompt (e.g., hit Windows key, type `command prompt` and select the app option that appears) and navigate to the folder that holds this README file. For example, I entered this in Command Prompt: `cd C:\Users\sasha\STM-practice\examples\02`.
2. Enter the following command in your Command Prompt window: `stm.exe Ex02 pars.txt user_pars.txt weather.txt level.txt`. You can copy and paste (but do not include the quotes).
3. Check the working directory for output files. `Ex02_temp.csv` has the predicted temperature values and can be opened in any spreadsheet program or text editor. Data could be plotted using R, Python, Excel, or similar programs. Make sure the file `Ex02_log.txt` confirms that the correct input files were used.
4. Make some tweaks and see what happens. Storage dimensions, managment settings, and weather can all be changed in `user_pars.txt`.

# Linux
Run `stm` in a shell with the following command: `./stm Ex02 pars.txt user_pars.txt`. Output files will be in the working directory. 

