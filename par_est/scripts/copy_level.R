# Copies slurry level data from other directory with originals

# Remove old versions
system('rm ../slurry_level/*.*')

# Get latest
system('cp ../../slurry_level/*.txt ../slurry_level/')
