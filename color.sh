#!/usr/bin/env bash

# Define an associative array to store the color values
declare -A colors=(
    [black]=0
    [brown]=1
    [red]=2
    [orange]=3
    [yellow]=4
    [green]=5
    [blue]=6
    [violet]=7
    [grey]=8
    [white]=9
)

# Function to convert color names to numbers
color_to_number() {
    local color="$1"
    if [[ -n "${colors[$color]}" ]]; then
        echo "${colors[$color]}"
    else
        echo "invalid color"
        exit 1
    fi
}

# Main script
main() {
    local num1
    local num2

    # Read input colors
    local color1="$1"
    local color2="$2"
    
    # Convert colors to numbers
    num1=$(color_to_number "$color1")
    num2=$(color_to_number "$color2")

    # Output two-digit number
    echo "${num1}${num2}"
}

# Call the main function with the input colors
main "$@"