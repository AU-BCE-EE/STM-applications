# STM-application/examples/05
Application of STM to small slurry tanks.

# Data source
These temperature measurements were made at Aarhus University Research Center Foulum in Denmark.
Animal slurry from several different types of animals was added to 1 m$^3$ plastic tanks in a single event (no additions after the initial filling event). 
The experiment was carried out by Anna Støckler at Aarhus University (<https://pure.au.dk/portal/en/persons/anna-joost-stoeckler(79434e7b-d9f3-4999-bbc2-3f2e0ef92384).html>).

# Directory and file information
## `logs`
STM output logs.

## `meas_temperature`
Original slurry temperature measurements (in `data`), restructured and average (by day) temperature (in `output` and `plots`), and the R scripts used for data processing (in `scripts`).
Users interested in daily average slurry temperature should use `meas_temperature/data/temp_meas_day.csv`.

## `plots`
Comparison of STM outut and measurements.

## `stm_output`
Output files from STM.

## `tank-diagram`
Images show location of temperature measurements within tanks.

## `weather`
Weather data from the weather station at the research center.
See `output/weather.csv` for the average temperature and solar radiation by day that are used by STM.
For more detailed data (as downloaded) see `measurements`.

## `examples/05`
STM input files and a script for running the program in Linux are in the root directory.
