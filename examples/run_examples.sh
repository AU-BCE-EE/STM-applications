# Runs all examples with latest version of model and parameter set

wget https://raw.githubusercontent.com/sashahafner/STM-applications/master/par_sets/pars.txt

cp pars.txt 01/pars.txt
cp pars.txt 02/pars.txt
cp pars.txt 03/pars/pars.txt
cp pars.txt 04/pars/pars.txt
cp pars.txt 05/pars/pars.txt

rm pars.txt

wget https://raw.githubusercontent.com/sashahafner/STM/master/src/stm.f90

gfortran stm.f90 -o stm
rm stm.f90
echo 'Compiled stm (or tried to).'
grep -i -n 'STM version' stm.f90 

sudo chmod +x stm

cp stm 01/
cp stm 02/
cp stm 01/
cp stm 04/
cp stm 05/

cd 03
./run.sh
cd ../04
./run.sh
cd ../05
./run.sh
