#!/usr/bin/env bash
sentence1=$(echo "$1" | tr -d '[]')
sentence2=$(echo "$2" | tr -d '[]')
if [[ $sentence1 == "$sentence2" ]]; then    
    echo equal
elif [[ $sentence1 == "" ]]; then
    echo sublist
elif [[ $sentence2 ==  "" ]]; then
    echo superlist
elif [[ $sentence1 =~ $sentence2, || $sentence1 =~ ${sentence2}$ ]]; then
    echo superlist
elif [[ $sentence2 =~ $sentence1, || $sentence2 =~ ${sentence1}$  ]]; then
    echo sublist
else
    echo unequal
fi
exit 0