#!/bin/bash

# Function to check if a number is prime
is_prime() {
    local num=$1
    if [ $num -lt 2 ]; then
        return 1
    fi
    for (( i=2; i*i<=num; i++ )); do
        if [ $((num % i)) -eq 0 ]; then
            return 1
        fi
    done
    return 0
}

# Function to find the nth prime number
nth_prime() {
    local n=$1
    if [ $n -lt 1 ]; then
        echo "invalid input"
        return 1
    fi
    local count=0
    local num=2
    while true; do
        if is_prime $num; then
            (( count++ ))
            if [ $count -eq $n ]; then
                echo $num
                return
            fi
        fi
        (( num++ ))
    done
}

# Main program
main() {
    local n=$1
    nth_prime $n
}

# Call main function with input
main "$@" 