#!/bin/bash

# Check if the input argument is provided
if [ $# -ne 1 ]; then
    echo "Usage: $0 <upper_limit>"
    exit 1
fi

# Extract the upper limit from the input argument
upper_limit=$1

# Create an array to track prime numbers (initialized to true)
# Index 0 and 1 represent numbers 0 and 1, which are not prime
declare -a primes=([0]=false [1]=false)
for ((i = 2; i <= upper_limit; i++)); do
    primes[$i]=true
done

# Apply the Sieve of Eratosthenes algorithm
for ((num = 2; num * num <= upper_limit; num++)); do
    # If num is prime, mark its multiples as composite
    if [ "${primes[num]}" == true ]; then
        for ((multiple = num * num; multiple <= upper_limit; multiple += num)); do
            primes[$multiple]=false
        done
    fi
done

# Print prime numbers up to the upper limit
echo "Prime numbers up to $upper_limit:"
for ((i = 2; i <= upper_limit; i++)); do
    if [ "${primes[i]}" == true ]; then
        echo "$i"
    fi
done