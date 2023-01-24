#!/bin/bash
# https://stackoverflow.com/questions/18039751/how-to-debug-a-bash-script-and-get-execution-time-per-command


N=`date +%s%N`
export PS4='+[$(((`date +%s%N`-$N)/1000000))ms][${BASH_SOURCE}:${LINENO}]: ${FUNCNAME[0]:+${FUNCNAME[0]}(): }'; set -x;

sleep 1
for ((i=0;i<2;i++)); do
        o=$(($RANDOM*$RANDOM/$RANDOM))
        echo $o
        sleep 0.$o
        ls -la 
done
exit