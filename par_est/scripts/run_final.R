# Run STM with final parameters

system('./stm A ../final_pars/pars.txt ../pars/A_user_pars.txt ../weather/Backa_weather.csv ../level/A_level.txt &
        ./stm B ../final_pars/pars.txt ../pars/B_user_pars.txt ../weather/Uppsala_weather.csv ../level/B_level.txt &
        ./stm C ../final_pars/pars.txt ../pars/C_user_pars.txt ../weather/Backa_weather.csv ../level/C_level.txt
        ./stm D ../final_pars/pars.txt ../pars/D_user_pars.txt ../weather/Backa_weather.csv ../level/D_level.txt
        ./stm F ../final_pars/pars.txt ../pars/F_user_pars.txt ../weather/Ottawa_weather.csv ../level/F_level.csv
       ')

# Move output
system('mv *_temp.csv* ../stm_output &
        mv *_weather* ../stm_output &
        mv *_log* ../stm_output &
        mv *_rates* ../stm_output')


