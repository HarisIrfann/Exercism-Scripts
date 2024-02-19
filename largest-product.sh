#!/bin/bash

# Function to calculate the largest series product
largest_series_product() {
    local input="$1"
    local span="$2"
    local max_product=0

    # Loop through the input sequence
    for (( i = 0; i <= ${#input} - span; i++ )); do
        local product=1

        # Extract the series of digits with the specified span
        local series="${input:i:span}"

        # Loop through the digits in the series and calculate the product
        for (( j = 0; j < ${#series}; j++ )); do
            local digit="${series:j:1}"
            (( product *= digit ))
        done

        # Update the maximum product if the current product is larger
        if (( product > max_product )); then
            max_product=$product
        fi
    done

    echo "$max_product"
}

# Main script logic
main() {
    local input="$1"
    local span="$2"
    largest_series_product "$input" "$span"
}

# Execute the main function with the provided input
main "$@"
