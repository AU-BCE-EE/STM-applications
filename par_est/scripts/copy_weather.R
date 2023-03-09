# Copies weather data from other directory where files were generated

# Remove old versions
system('rm ../weather/*.csv')

# Get latest
system('cp ../../weather/Backa/output/Backa_weather.csv ../weather/')
system('cp ../../weather/Uppsala/output/Uppsala_weather.csv ../weather/')
system('cp ../../weather/Ottawa/output/Ottawa_weather.csv ../weather/')
system('cp ../../weather/Tjele/output/Tjele_weather.csv ../weather/')

