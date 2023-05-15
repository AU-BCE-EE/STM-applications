# STM-application
Applications, examples, and parameters for STM, a simple heat transfer model for predicting the temperature of stored animal slurry or similar materials.
See [the STM repo](https://github.com/sashahafner/STM) for source code, executables, and more info on the model/program itself.

The following open-access paper describes the model and command-line STM program:

Hafner, S.D., Mjöfors, K., 2023. STM: A software tool for predicting daily temperature in stored animal slurry. SoftwareX 22, 101354. <https://doi.org/10.1016/j.softx.2023.101354>

# Maintainer and contributors
Sasha D. Hafner developed and maintains this repo.
Find contact information for questions etc. here: <https://au.dk/sasha.hafner@bce>.
Data used in the examples were kindly shared by Kristina Mjöfors, Søren O. Petersen, [Anna Holm Støckler](https://github.com/Stoeckler), and [Chih-Yu Hung](https://github.com/Chih-yuHung).

# Getting started
First, install or compile STM by following the instructions under "Installation" in the [STM repo README file](https://github.com/sashahafner/STM#readme).
New STM users interested in learning how to use the program should copy this entire STM-applications repository.
If "clone this repo" doesn't mean anything, the simplest way for non-GitHub users to do get a copy of these files is to click on the green "Code" button toward the top right of the repo main page and then "Download ZIP".
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
See the `README.md` files in each subdirectory for more detailed instructions, as well as information on data sources.

The script `examples/run_examples.sh` can be used on Linux to:

* update all copies of `pars.txt` with the latest version from GitHub (from *main* branch),
* download and compile the latest version of the program source code (*main* branch), and
* run all examples

# `par_calc`
This directory contains a single xlsx file that can be used for calculating parameter values.
However, the default parameters available in `par_sets` are probably the best choice in most cases.

# `par_est`
Scripts for parameter estimation based on fitting to measurements made at 3 sites in Sweden.

# `par_sets`
If you are here for just the latest version of the default parameter file, this directory is the place to look.
For information on how these values were determined, see the `par_est` directory.
The file `pars.txt` will contain the latest parameter set, while the latest (a copy) and earlier versions can be identified by the version number in the file names.

# Bugs and more
If you find a problem in this repo (e.g., examples don't work or you see a mistake) please create an [issue](https://github.com/sashahafner/STM-applications/issues).
Some anticipated issues are listed below.

* Missing stm.exe on Windows. Windows anti-virus software may delete stm.exe as soon as it is downloaded from the STM repo simply because it is an executable. 
* Missing R or R packages. The plots in examples 3 and 4 will not be created unless R and all required packages are installed (see `examples/*/R_scripts/packages.R`) and the `Rscript` command works.
