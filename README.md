# STM-application
Applications, examples, and parameters for STM, a simple heat transfer model for predicting the temperature of stored animal slurry or similar materials.
See [the STM repo](https://github.com/sashahafner/STM) for source code and more info on the model/program itself.

# Getting started
New STM users interested in learning how to use the program should copy this entire repository.
The simplest way for non-GitHub users to do this is to click on the green "Code" button toward the top right of the repo main page and then "Download ZIP".
Extract the downloaded file, and check out the `examples` directory.
You can find more details below.

# `examples`
The `examples` directory includes 4 examples.
Each example includes all the files necessary for running STM *except* the executable versions of STM.
Users can download the latest versions from the [STM repo](https://github.com/sashahafner/STM).
After downloading the correct file, put a copy into each example subdirectory (or set the PATH variable).

The first two examples are quite simple, and for them, STM is called directly from a console (e.g., Command Prompt in Windows or Bash in Linux).
Examples 3 and 4 are more complicated, with simulation of multiple locations or scenarios and the use of R for plotting results. 
These examples include batch files (for Windows) and shell scripts (for Linux) for calling STM, moving files, and calling R scripts.
These two examples should provide some ideas for more complicated workflows.
See the `README.md` files in each subdirectory for more detailed instructions.

# `par_calc`
This directory contains a single xlsx file that can be used for calculating parameter values.
However, the default parameters available in `par_sets` are probably the best choice in most cases.

# `par_est`
Scripts for parameter estimation based on fitting to measurements made at 3 sites in Sweden.

# `par_sets`
If you are here for just the latest version of the default parameter file, you can find it here.
For information on how these values were determined, see the `par_est` directory.
The file `pars.txt` will contain the latest parameter set, while earlier versions can be identified by the version number in the file names.

# Bugs and more
If you find a problem in this repo (e.g., examples don't work or you see a mistake) please create an [issue](https://github.com/sashahafner/STM-applications/issues).
Some anticipated issues are listed below.

* Missing stm.exe on Windows. Windows anti-virus software may delete stm.exe as soon as it is downloaded simply because it is an executable. 
* Missing R or R packages. The plots in examples 3 and 4 will not be created unless R and all required packages are installed (see `examples/*/R_scripts/packages.R`) and the `Rscript` command works.
