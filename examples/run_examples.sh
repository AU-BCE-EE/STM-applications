# Runs all examples with latest version of model and parameter set

# Get current parameter file
wget https://raw.githubusercontent.com/sashahafner/STM-applications/master/par_sets/pars.txt

# Copy it into dir for each example
cp pars.txt 01/pars.txt
cp pars.txt 02/pars.txt
cp pars.txt 03/pars/pars.txt
cp pars.txt 04/pars/pars.txt
cp pars.txt 05/pars/pars.txt
cp pars.txt 06/pars.txt

# Remove original
rm pars.txt

# Get STM source code
wget https://raw.githubusercontent.com/AU-BCE-EE/STM/master/src/stm.f90

# Compile stm.f90 to stm
gfortran stm.f90 -o stm
echo 'Compiled stm (or tried to).'
grep -i -n 'STM version' stm.f90 
rm stm.f90

echo 'Enter local account password to make stm executable.'
sudo chmod +x stm

# Copy in stm 
cp stm 01/
cp stm 02/
cp stm 03/
cp stm 04/
cp stm 05/
cp stm 06/

# And remove it
rm stm

cd 01
echo 'Example 01'
./stm Ex01 pars.txt user_pars.txt weather.txt level.txt
echo ''
cd ../02
echo 'Example 02'
./stm Ex02 pars.txt user_pars.txt
echo ''
cd ../03
echo 'Example 03'
./run.sh
echo ''
cd ../04
echo 'Example 04'
./run.sh
echo ''
cd ../05
echo 'Example 05'
./run.sh
echo ''
cd ../06
echo 'Example 06'
./run.sh
cd ..

# Remove all copies of stm
rm */stm

echo 'Ran examples 1 - 6 (or tried to).'
