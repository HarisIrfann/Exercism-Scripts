#!/bin/bash

# Function to count nucleotide occurrences
count_nucleotides() {
    local sequence=$1
    local nucleotides="ACGT"
    
    # Initialize counts for each nucleotide to 0
    declare -A counts=([A]=0 [C]=0 [G]=0 [T]=0)
    
    # Iterate through the sequence and count nucleotides
    for ((i = 0; i < ${#sequence}; i++)); do
        local nucleotide="${sequence:i:1}"
        if [[ ! $nucleotides =~ $nucleotide ]]; then
            echo "Invalid nucleotide in strand" >&2
            exit 1
        fi
        ((counts[$nucleotide]++))
    done
    
    # Print nucleotide counts in ACGT order
    for n in A C G T; do
        echo "$n: ${counts[$n]}"
    done
}

# Main script starts here
sequence=$1

# Check if the sequence is provided
if [ -z "$sequence" ]; then
    # If sequence is empty, print counts for each nucleotide as 0
    for n in A C G T; do
        echo "$n: 0"
    done
    exit 0
fi

# Call the function to count nucleotides
count_nucleotides "$sequence"

