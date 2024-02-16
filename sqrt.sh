#!/bin/bash

# Function to calculate square root
calculate_sqrt() {
    radicand=$1
    echo "sqrt($radicand)" | bc -l | awk '{printf "%.0f\n", $1}'
}

# Check if input is provided
if [ -z "$1" ]; then
    echo "Usage: $0 <radicand>"
    exit 1
fi

# Get the radicand from command-line argument
radicand=$1

# Calculate square root
result=$(calculate_sqrt "$radicand")

# Output the result
echo "$result"

