#!/usr/bin/env bash

calculate_square_of_sum() {
    local n=$1
    local sum=$(( n * (n + 1) / 2 ))
    local square_of_sum=$(( sum * sum ))
    echo "$square_of_sum"
}

calculate_sum_of_squares() {
    local n=$1
    local sum_of_squares=0
    for (( i = 1; i <= n; i++ )); do
        sum_of_squares=$(( sum_of_squares + i * i ))
    done
    echo "$sum_of_squares"
}

calculate_difference() {
    local n=$1
    local square_of_sum=$(calculate_square_of_sum "$n")
    local sum_of_squares=$(calculate_sum_of_squares "$n")
    local difference=$(( square_of_sum - sum_of_squares ))
    echo "$difference"
}

# Main script logic
main() {
    local operation=$1
    local n=$2
    case $operation in
        square_of_sum)
            calculate_square_of_sum "$n" ;;
        sum_of_squares)
            calculate_sum_of_squares "$n" ;;
        difference)
            calculate_difference "$n" ;;
        *)
            echo "Invalid operation: $operation"
            exit 1 ;;
    esac
}

# Execute the main function with the provided operation and value of N
main "$@"