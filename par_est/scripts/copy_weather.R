# Copies weather data from other directory where files were generated

# Remove old versions
system('rm ../weather/*.csv')

# Get latest
system('cp ../../weather/*/output/*.csv ../weather/')
