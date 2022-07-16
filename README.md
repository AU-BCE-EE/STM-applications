# STM-application
Applications, examples, and parameters for STM, a simple heat transfer model for predicting the temperature of stored animal slurry or similar materials.
See [the STM repo](https://github.com/sashahafner/STM) for more info on the model/program itself.

# Getting started
If you are new to STM, you should copy this entire repository.
The simplest approach for non-GitHub users is to click on the green "Code" button and then "Download ZIP".
Extract the downloaded file, and check out the `examples` directory.
You can find more details below.

# `examples`
The `examples` directory includes 4 examples.
The first two are quite simple, and for them, STM should be called directly from a console (e.g., Command Prompt in Windows or Bash in Linux).
See the `README.md` files in each subdirectory for detailed instructions.
Examples 3 and 4 are more complicated, with simulation of multiple locations and the use of R for plotting results. 
These examples include batch files (for Windows) and shell scripts (for Linux) for calling STM, moving files, and calling R scripts.
These two examples should provide some ideas for more complicated workflows.

# `par_calc`
This directory contains a single xlsx file that can be used for calculating parameter values.
However, the default parameters available in `par_sets` are probably the best choice in most cases.

# `par_est`
Scripts for parameter estimation based on fitting to measurements made at 3 sites in Sweden.

# `par_sets`
If you are here for just the latest version of the default parameter file, you can find it here.

# Bugs and more
If you find a problem in this repo (e.g., examples don't work or you see a mistake) please create an [issue](https://github.com/sashahafner/STM-applications/issues).

