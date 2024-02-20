#!/usr/bin/env bash

# Function to calculate the aliquot sum of a number
aliquot_sum() {
    local n=$1
    local sum=0

    for ((i = 1; i <= n / 2; i++)); do
        if ((n % i == 0)); then
            ((sum += i))
        fi
    done

    echo $sum
}

# Main function to determine the classification of a number
classify_number() {
    local num=$1
    local sum=$(aliquot_sum $num)

    if ((sum == num)); then
        echo "perfect"
    elif ((sum < num)); then
        echo "abundant"
    else
        echo "deficient"
    fi
}

# Validate input argument
if (( $# != 1 )) || (( $1 <= 0 )); then
    echo "Usage: $0 <positive integer>"
    exit 1
fi

# Call the main function with the input number
classify_number "$1"
