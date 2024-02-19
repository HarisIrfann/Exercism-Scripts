#!/bin/bash

limit=$1 
shift
sum=0
declare -A multiple

for i in "$@"
do
    if [[ $i -eq 0 ]]
    then
        continue
    fi

    for (( j=i; j<limit; j+=i ))
    do
        if [[ -z ${multiple[$j]} ]]
        then
            ((sum += j))
            multiple[$j]=1
        fi
    done
done

echo $sum