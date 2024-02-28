#!/bin/bash

# Function to validate input base and output base
validate_base() {
    local base="$1"
    if [ "$base" -le 1 ] || [ "$base" -eq 1 ] || [ "$base" -ge 37 ]; then
        return 1
    fi
}

# Function to convert a number from one base to another base
convert_base() {
    local number="$1"
    local from_base="$2"
    local to_base="$3"

    # Validate input and output bases
    validate_base "$from_base" || return 1
    validate_base "$to_base" || return 1

    # Convert the number to base 10
    decimal=$(echo "ibase=$from_base; $number" | bc)

    # Convert the decimal number to the desired base
    converted_number=$(echo "obase=$to_base; $decimal" | bc)

    echo "$converted_number"
}

# Example usage
convert_base "$@"
