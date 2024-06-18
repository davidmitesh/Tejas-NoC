#!/bin/bash

if [ "$#" -ne 6 ]; then
    echo "Illegal parameters"
	echo "Usage bash spec2017.sh script_status_file jarfile configfile statsdir outputsdir scriptdir"
	exit
fi

rm $1
jarfile=$2
configfile=$3
statsdir=$4
outputsdir=$5
scriptdir=$6

echo "Please don't use forward slash at the end of directory path"

#bash "$scriptdir"spec2006_single.sh "perlbench" $jarfile $configfile $statsdir $outputsdir >>  $1 2>&1
bash "$scriptdir/spec2017single1.sh" "mcf_r" $jarfile $configfile $statsdir $outputsdir >>  $1 2>&1 
bash "$scriptdir/spec2017single1.sh" "leela_r" $jarfile $configfile $statsdir $outputsdir >>  $1 2>&1 
bash "$scriptdir/spec2017single1.sh" "imagick_r" $jarfile $configfile $statsdir $outputsdir >>  $1 2>&1 
bash "$scriptdir/spec2017single1.sh" "deepsjeng_r" $jarfile $configfile $statsdir $outputsdir >>  $1 2>&1 
bash "$scriptdir/spec2017single1.sh" "gcc_r" $jarfile $configfile $statsdir $outputsdir >>  $1 2>&1
bash "$scriptdir/spec2017single1.sh" "mcf_s" $jarfile $configfile $statsdir $outputsdir >>  $1 2>&1 
bash "$scriptdir/spec2017single1.sh" "leela_s" $jarfile $configfile $statsdir $outputsdir >>  $1 2>&1 
bash "$scriptdir/spec2017single1.sh" "gcc_s" $jarfile $configfile $statsdir $outputsdir >>  $1 2>&1 
bash "$scriptdir/spec2017single1.sh" "deepsjeng_s" $jarfile $configfile $statsdir $outputsdir >>  $1 2>&1 

