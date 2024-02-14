#!/usr/bin/env bash

# Check if the number of arguments is not equal to 2
if (( $# != 2 )); then
    echo "Invalid number of arguments. Usage: $0 <x-coordinate> <y-coordinate>"
    exit 1
fi

# Check if arguments are non-numeric
for arg; do
    if [[ ! $arg =~ ^[+-]?[0-9]+(\.[0-9]+)?$ ]]; then
        echo "Non-numeric argument: $arg"
        exit 1
    fi
done

# Assign coordinates to variables
x=$1
y=$2

# Calculate distance from the origin
distance=$(bc <<< "scale=4; sqrt($x^2 + $y^2)")

# Determine earned points based on distance
if (( $(bc <<< "$distance <= 1") )); then
    echo "10"
elif (( $(bc <<< "$distance <= 5") )); then
    echo "5"
elif (( $(bc <<< "$distance <= 10") )); then
    echo "1"
else
    echo "0"
fi

exit 0