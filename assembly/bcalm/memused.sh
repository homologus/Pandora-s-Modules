#!/bin/bash
"$@" &
cd /proc/$!
max=0
while [ -f status ]
do
sleep 0.1
if [ -f status ]
then
    mem=`cat status | grep VmHWM | tr -s [:blank:] | cut -d ' ' -f 2`
    if [ "$mem" -gt "$max" ]
    then
    max=$mem
    fi
fi;
done
echo "maximal memory used ( kilobyte(s) (K / Kb))" $max
