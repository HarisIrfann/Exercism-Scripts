#!/usr/bin/env bash

# Check if the script is provided with exactly one argument
if [ "$#" -ne 1 ]; then
    echo "Usage: leap.sh <year>"
    exit 1
fi

year=$1

# Check if the argument contains alphabets
if [[ $year =~ [a-zA-Z] ]]; then
    echo "Usage: leap.sh <year>"
    exit 1
fi

# Check if the argument contains a decimal point
if [[ $year =~ \. ]]; then
    echo "Usage: leap.sh <year>"
    exit 1
fi

# Check if the year is divisible by 4 and not divisible by 100 or is divisible by 400
if (( year % 4 == 0 && year % 100 != 0 )) || (( year % 400 == 0 )); then
    echo true
else
    echo false
fi