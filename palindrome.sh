#!/bin/bash

# Function to check if a number is palindrome
is_palindrome() {
    local num=$1
    local reversed=$(echo $num | rev)
    [ $num -eq $reversed ]
}

# Function to find factors of a number within a given range
find_factors() {
    local num=$1
    local range_start=$2
    local range_end=$3
    factors=()
    for (( i=range_start; i<=range_end; i++ )); do
        if (( num % i == 0 )); then
            factors+=($i $(( num / i )))
        fi
    done
    echo "${factors[@]}"
}

# Main function to find smallest and largest palindrome products
find_palindrome_products() {
    local range_start=$1
    local range_end=$2
    smallest=99999999999
    largest=0

    for (( i=range_start; i<=range_end; i++ )); do
        for (( j=i; j<=range_end; j++ )); do
            product=$(( i * j ))
            if is_palindrome $product; then
                [ $product -lt $smallest ] && smallest=$product
                [ $product -gt $largest ] && largest=$product
            fi
        done
    done

    echo "Smallest palindrome product: $smallest. Factors: $(find_factors $smallest $range_start $range_end)"
    echo "Largest palindrome product: $largest. Factors: $(find_factors $largest $range_start $range_end)"
}


