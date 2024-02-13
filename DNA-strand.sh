#!/usr/bin/env bash
str1=$1
str2=$2
len=${#str1}
len2=${#str2}
rasp=0

if [[ $# -eq 0 || $# -eq 1 ]]; then
    echo "Insufficient arguments"
    exit 1
fi

if [[ $len -eq $len2 ]]; then
    for (( i=0; i<=$len; i++ ))
    do
        if [[ "${str1:i:1}" != "${str2:i:1}" ]]; then
        let "rasp=rasp+1"
        fi
    done
    echo $rasp
else
    echo "strands must be of equal length"
    exit 1
fi
