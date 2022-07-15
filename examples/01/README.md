# STM-applications example 1
Calculation of stored slurry temperature with detailed weather and slurry level inputs.
This README file explains how to run (and modify) the simulations in example 1.

# Windows
## Quick and easy 
The simplest way to run the example is by double-clicking the file `run.bat`.
This batch file removes the old output, calls `stm.exe` twice (for two locations), moves the STM output to the `stm_output` directory, and finally (if R is installed etc.) creates plots.
To confirm that the program has in fact run, check for new log and other output files in `stm_output` or, or check for plots in `plots`.
The \*.csv files can be opened in any spreadsheet program (using "," as a separator and "." for decimals) or text editor.
The \*.txt files can be opened in any text editor.

Parameter values can be changed by editing the files in the `pars` directory.

## More details
The batch file contains the commands used to run the program and organize output files.
The `stm.exe` commands are the essential ones, calling up STM and specifying the names and locations of input files.
To practice using STM, users can follow the steps below.

1. Create a new directory, called `STM_practice` here
2. Open Command Prompt (e.g., hit Windows key, type `command prompt`
