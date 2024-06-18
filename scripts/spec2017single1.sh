#!/bin/bash
#usage bash spec2006_tejasBase_runBenchmark.sh <benchmark>
#export LD_LIBRARY_PATH="/mnt/srishtistr0/scratch/rajshekar/tejas/lib/"

if [ "$#" -ne 1 ]; then
    echo "Illegal parameters"
	echo "Usage bash spec2017.sh benchmark jarfile configfile statsdir outputsdir"
	exit
fi

#jarfile="/mnt/srishtistr0/home/prathmesh/workspace/Tejas/jars/tejas.jar"
#jarfile=$2
jarfile="/home/mitesh/Documents/Tejas/jars/tejas.jar"
#configfile="/mnt/srishtistr0/home/prathmesh/workspace/Tejas/src/simulator/config/config.xml"
#configfile=$3
configfile="/home/mitesh/Documents/Tejas/src/simulator/config/config.xml"
#outputfiledir="/mnt/srishtistr0/home/prathmesh/scripts/stats"$2
#outputfiledir=$4
outputfiledir="/home/mitesh/Documents/Tejas/tests/output"
outputfile=""

stdoutfiledir="/home/mitesh/Documents/Tejas/tests/stdoutput"
#stdoutfiledir=$5
stdoutfile=""

specpath="/home/mitesh/Documents/spec2017/SPEC2017"

if [ $1 = mcf_r ]
then
executable="$specpath/benchspec/CPU/505.mcf_r/exe/mcf_r_base.miteshTest-m64 /home/mitesh/Documents/spec2017/SPEC2017/benchspec/CPU/505.mcf_r/data/refrate/input/inp.in"
outputfile=$outputfiledir/"mcf_r"
stdoutfile=$stdoutfiledir/"mcf_r"
else
if [ $1 = leela_r ]
then
executable="/home/mitesh/Documents/spec2017/SPEC2017/benchspec/CPU/541.leela_r/exe/leela_r_base.miteshTest-m64 /home/mitesh/Documents/spec2017/SPEC2017/benchspec/CPU/541.leela_r/data/refrate/input/ref.sgf"
outputfile=$outputfiledir/"leela_r"
stdoutfile=$stdoutfiledir/"leela_r"
else
if [ $1 = imagick_r ]
then
executable="/home/mitesh/Documents/spec2017/SPEC2017/benchspec/CPU/538.imagick_r/exe/imagick_r_base.mytest-m64 /home/mitesh/Documents/spec2017/SPEC2017/benchspec/CPU/538.imagick_r/data/refrate/input/refrate_input.tga"
outputfile=$outputfiledir/"imagick_r"
stdoutfile=$stdoutfiledir/"imagick_r"
else
if [ $1 = deepsjeng_r ]
then
executable="/home/mitesh/Documents/spec2017/SPEC2017/benchspec/CPU/531.deepsjeng_r/exe/deepsjeng_r_base.miteshTest-m64 /home/mitesh/Documents/spec2017/SPEC2017/benchspec/CPU/531.deepsjeng_r/data/refrate/input/ref.txt"
outputfile=$outputfiledir/"deepsjeng_r"
stdoutfile=$stdoutfiledir/"deepsjeng_r"
else
if [ $1 = gcc_r ]
then
executable="/home/mitesh/Documents/spec2017/SPEC2017/benchspec/CPU/502.gcc_r/exe/cpugcc_r_base.miteshTest-m64 /home/mitesh/Documents/spec2017/SPEC2017/benchspec/CPU/502.gcc_r/data/refrate/input/gcc-smaller.c"
outputfile=$outputfiledir/"gcc_r"
stdoutfile=$stdoutfiledir/"gcc_r"
else
if [ $1 = bwaves_r ]
then
executable="/home/mitesh/Documents/spec2017/SPEC2017/benchspec/CPU/503.bwaves_r/exe/bwaves_r_base.mytest-m64 /home/mitesh/Documents/spec2017/SPEC2017/benchspec/CPU/503.bwaves_r/data/refrate/input/bwaves_1.in"
outputfile=$outputfiledir/"bwaves_r"
stdoutfile=$stdoutfiledir/"bwaves_r"
else
if [ $1 = parest_r ]
then
executable="/home/mitesh/Documents/spec2017/SPEC2017/benchspec/CPU/510.parest_r/exe/parest_r_base.mytest-m64 /home/mitesh/Documents/spec2017/SPEC2017/benchspec/CPU/510.parest_r/data/refrate/input/ref.prm"
outputfile=$outputfiledir/"parest_r"
stdoutfile=$stdoutfiledir/"parest_r"
#else
#if [ $1 = imagick_s ]
#then
#executable="$specpath/benchspec/CPU/638.imagick_s/run/run_base_test_mytest-m64.0000/imagick_r_base.mytest-m64 $specpath/benchspec/CPU/538.imagick_r/run/run_base_test_mytest-m64.0000/test_input.tga"
#outputfile=$outputfiledir/"imagick_s"
#stdoutfile=$stdoutfiledir/"imagick_s"
else
if [ $1 = povray_r ]
then
executable="/home/mitesh/Documents/spec2017/SPEC2017/benchspec/CPU/511.povray_r/exe/povray_r_base.mytest-m64 /home/mitesh/Documents/spec2017/SPEC2017/benchspec/CPU/511.povray_r/data/refrate/input/SPEC-benchmark-ref.ini"
outputfile=$outputfiledir/"povray_r"
stdoutfile=$stdoutfiledir/"povray_r"
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
echo "starting : "$outputfile
java -Xmx1024m -jar $jarfile $configfile $outputfile $executable > $stdoutfile
echo "finished : "$outputfile
