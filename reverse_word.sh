#!/bin/bash

# Function to reverse a string
reverse_string() {
    local input=$1
    local reversed=""
    local length=${#input}
    
    # Loop through the input string from the end to the beginning
    for (( i=length-1; i>=0; i-- )); do
        reversed="${reversed}${input:i:1}"  # Append each character to the reversed string
    done
    
    echo "$reversed"
}

# Main script
read -r -p "Enter a string: " input_string
reversed_string=$(reverse_string "$input_string")
echo "Reversed string: $reversed_string"
