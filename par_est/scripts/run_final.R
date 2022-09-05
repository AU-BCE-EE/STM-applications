# Run STM with final parameters

system('./stm Back ../final_pars/pars.txt ../pars/Back_u_pars.txt ../weather/Backa_weather.csv ../level/Back_level.txt &
        ./stm Fitt ../final_pars/pars.txt ../pars/Fitt_u_pars.txt ../weather/Backa_weather.csv ../level/Fitt_level.txt &
        ./stm Lind ../final_pars/pars.txt ../pars/Lind_u_pars.txt ../weather/Backa_weather.csv ../level/Raan_level.txt
        ./stm Raan ../final_pars/pars.txt ../pars/Raan_u_pars.txt ../weather/Uppsala_weather.csv ../level/Raan_level.txt
       ')

# Move output
system('mv *_temp.csv* ../stm_output &
        mv *_weather* ../stm_output &
        mv *_log* ../stm_output &
        mv *_rates* ../stm_output')


