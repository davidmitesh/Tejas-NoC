# g++ -o hello.o -static hello_world.cpp

# java -jar /home/mitesh/Documents/Tejas/jars/tejas.jar /home/mitesh/Documents/Tejas/src/simulator/config/config.xml /home/mitesh/Documents/Tejas/tests/hello.out /home/mitesh/Documents/Tejas/tests/hello.o

# kill -9 $(ps -aux | grep "hello.o" | grep -v "grep" | awk '{print $2}')

if [ "$#" -ne 1 ]; then
    echo "Illegal parameters"
	echo "Usage bash test.sh benchmark"
	exit
fi

jarfile="/home/mitesh/Documents/Tejas/jars/tejas.jar"
#jarfile=$2

configfile="/home/mitesh/Documents/Tejas/src/simulator/config/config.xml"
#configfile=$3

outputfiledir="/home/mitesh/Documents/Tejas/tests/new-new"
#outputfiledir=$4
#outputfile=""

#stdoutfiledir="/mnt/srishtistr0/home/prathmesh/scripts/outputs"$2
#stdoutfiledir=$5
#stdoutfile=""

specpath="/home/mitesh/Documents/spec2017/SPEC2017"

if [ $1 = mcf_r ]
then
executable="$specpath/benchspec/CPU/505.mcf_r/exe/mcf_r_base.miteshTest-m64 $specpath/benchspec/CPU/505.mcf_r/data/refrate/input/inp.in"
outputfile=$outputfiledir/"mcf-r_spec"
# # stdoutfile=$stdoutfiledir/"mcf_r"
else
if [ $1 = leela_r ]
then
executable="$specpath/benchspec/CPU/541.leela_r/exe/leela_r_base.miteshTest-m64 $specpath/benchspec/CPU/541.leela_r/data/refrate/input/ref.sgf"
outputfile=$outputfiledir/"leela-r_spec"
# # stdoutfile=$stdoutfiledir/"leela_r"
else
if [ $1 = gcc_r ]
then
executable="$specpath/benchspec/CPU/502.gcc_r/exe/cpugcc_r_base.miteshTest-m64 $specpath/benchspec/CPU/502.gcc_r/data/refrate/input/gcc-smaller.c"
outputfile=$outputfiledir/"gcc-r_spec"
else
if [ $1 = bwaves_r ]
then
executable="$specpath/benchspec/CPU/503.bwaves_r/exe/bwaves_r_base.miteshTest-m64 $specpath/benchspec/CPU/503.bwaves_r/data/refrate/input/bwaves_1.in"
outputfile=$outputfiledir/"bwaves-r_spec"
else 
if [ $1 = ocean_ncp ]
then
executable="/home/mitesh/Documents/parsec-3.0/ext/splash2/apps/ocean_ncp/inst/amd64-linux.gcc/bin/ocean_ncp -n258 -p4 -e1e-07 -r20000 -t28800"
outputfile=$outputfiledir/"ocean-ncp_parsec"
else 
if [ $1 = radiosity ]
then
executable="/home/mitesh/Documents/parsec-3.0/ext/splash2/apps/radiosity/inst/amd64-linux.gcc/bin/radiosity -batch -room -p 1"
outputfile=$outputfiledir/"radiosity_parsec"
else 
if [ $1 = ocean_cp ]
then
executable="/home/mitesh/Documents/parsec-3.0/ext/splash2/apps/ocean_cp/inst/amd64-linux.gcc/bin/ocean_cp -n258 -p1 -e1e-07 -r20000 -t28800"
outputfile=$outputfiledir/"ocean-cp_parsec"
else 
if [ $1 = blackscholes ]
then
executable="/home/mitesh/Documents/parsec-3.0/pkgs/apps/blackscholes/inst/amd64-linux.gcc/bin/blackscholes 4 /home/mitesh/Documents/parsec-3.0/pkgs/apps/blackscholes/run/in_4.txt prices.txt"
outputfile=$outputfiledir/"blackscholes_parsec"
else
echo "invalid argument "$1
exit 1
fi
fi
fi
fi
fi
fi
fi
fi


#executable="/home/mitesh/Documents/parsec-3.0/ext/splash2/apps/ocean_ncp/inst/amd64-linux.gcc/bin/ocean_ncp -n258 -p1 -e1e-07 -r20000 -#t28800"
# executable="/home/mitesh/Documents/parsec-3.0/ext/splash2/apps/radiosity/inst/amd64-linux.gcc/bin/radiosity -batch -room -p 1"
# executable="/home/mitesh/Documents/parsec-3.0/ext/splash2/apps/ocean_cp/inst/amd64-linux.gcc/bin/ocean_cp -n258 -p1 -e1e-07 -r20000 -t28800"
# executable="/home/mitesh/Documents/parsec-3.0/pkgs/apps/blackscholes/inst/amd64-linux.gcc/bin/blackscholes 4 /home/mitesh/Documents/parsec-3.0/pkgs/apps/blackscholes/run/in_4.txt prices.txt"
# outputfile=$outputfiledir
# stdoutfile=$stdoutfiledir/$2

#executable="$specpath/benchspec/CPU/505.mcf_r/exe/mcf_r_base.miteshTest-m64 $specpath/benchspec/CPU/505.mcf_r/data/refrate/input/inp.in"
#outputfile=$outputfiledir/"mcf-r_spec"
echo "starting : "$outputfile
java -Xmx1024m -jar $jarfile $configfile $outputfile $executable
echo "finished : "$outputfile

