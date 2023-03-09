# STM-applications example 1
Calculation of stored slurry temperature for a single site with detailed weather and slurry level inputs.
This README file explains how to run (and modify) the simulations in example 1.

# Windows
1. Install STM by following the instructions under "Installation" in the [STM repo README file](https://github.com/sashahafner/STM#readme).
2. Open Command Prompt (e.g., hit Windows key, type `command prompt` and select the app option that appears) and navigate to the folder that holds this README file. For example, I entered this in Command Prompt: `cd C:\Users\sasha\STM-practice\examples\01`.
3. Enter the following command in your Command Prompt window: `stm.exe Ex01 pars.txt user_pars.txt weather.txt level.txt`. You can copy and paste (but do not include the quotes). In PowerShell, you will need a `.\` prefix: `.\stm.exe Ex01 pars.txt user_pars.txt weather.txt level.txt` (and PowerShell may automatically add it).
4. Check the working directory for output files. `Ex01_temp.csv` has the predicted temperature values and can be opened in any spreadsheet program or text editor. Data could be plotted using R, Python, Excel, or similar programs. Make sure the file `Ex01_log.txt` confirms that the correct input files were used.

# Linux and macOS
1a. Install STM by following the instructions under "Installation" in the [STM repo README file](https://github.com/sashahafner/STM#readme). 
1b. Alternatively, compile it yourself by following the instructions in the [STM repo README file](https://github.com/sashahafner/STM#readme).
2. In Bash, Terminal, or another shell, navigate to the directory with this README file and STM input files.
3. Run `stm` in a shell with the following command: `./stm Ex01 pars.txt user_pars.txt weather.txt level.txt`. 4. 4. Check the working directory for output files. `Ex01_temp.csv` has the predicted temperature values and can be opened in any spreadsheet program or text editor. Data could be plotted using R, Python, Excel, or similar programs. Make sure the file `Ex01_log.txt` confirms that the correct input files were used. 

Make some changes to inputs and see what happens. Storage dimensions or managment can be changed in `user_pars.txt` (open and edit it in any text editor). The slurry level and weather files could be changed as well (but see example 2 for an easier approach).