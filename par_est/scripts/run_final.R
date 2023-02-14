# Run STM with final parameters

system('./stm A ../final_pars/pars.txt ../pars/A_user_pars.txt ../weather/Backa_weather.csv ../slurry_level/A_level.txt &
        ./stm B ../final_pars/pars.txt ../pars/B_user_pars.txt ../weather/Uppsala_weather.csv ../slurry_level/B_level.txt &
        ./stm C ../final_pars/pars.txt ../pars/C_user_pars.txt ../weather/Backa_weather.csv ../slurry_level/C_level.txt
        ./stm D ../final_pars/pars.txt ../pars/D_user_pars.txt ../weather/Backa_weather.csv ../slurry_level/D_level.txt
        ./stm E ../final_pars/pars.txt ../pars/E_user_pars.txt ../weather/Tjele_weather.csv ../slurry_level/E_level.txt
        ./stm F ../final_pars/pars.txt ../pars/F_user_pars.txt ../weather/Ottawa_weather.csv ../slurry_level/F_level.txt')

# Move output
system('mv *_temp.csv* ../stm_output_final &
        mv *_weather.csv* ../stm_output_final &
        mv *_log.txt* ../stm_output_final &
        mv *_summary.txt* ../stm_output_final &
        mv *_rates.csv* ../stm_output_final')


