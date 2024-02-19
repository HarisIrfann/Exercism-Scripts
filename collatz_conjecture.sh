#!/bin/bash

# Function to calculate the number of steps required to reach 1
collatz_steps() {
    local n=$1
    local steps=0
    
    # Continue until n becomes 1
    while [ $n -ne 1 ]; do
        # If n is even, divide by 2
        if [ $((n % 2)) -eq 0 ]; then
            n=$((n / 2))
        else
            # If n is odd, multiply by 3 and add 1
            n=$((3 * n + 1))
        fi
        steps=$((steps + 1))
    done
    
    echo $steps
}

# Main script starts here
num=$1

# Check if the input is a positive integer
if ! [[ $num =~ ^[1-9][0-9]*$ ]]; then
    echo "Error: Only positive numbers are allowed" >&2
    exit 1
fi

# Call the function and output the result
result=$(collatz_steps $num)
echo "$result"
