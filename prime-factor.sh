#!/usr/bin/env bash

# Function to compute the prime factors of a given number
compute_prime_factors() {
    local num=$1
    local divisor=2
    local factors=()

    # Special case: if the number is 1, there are no prime factors
    if (( num == 1 )); then
        echo "${factors[@]}"
        return
    fi

    # Iterate through possible divisors starting from 2
    while (( num > 1 )); do
        # Check if the current divisor is a factor of the number
        while (( num % divisor == 0 )); do
            # If the divisor is a factor, add it to the list of factors
            factors+=("$divisor")
            # Divide the number by the divisor
            num=$(( num / divisor ))
        done
        # Move to the next divisor
        (( divisor++ ))
    done

    # Print the list of prime factors
    echo "${factors[@]}"
}

# Main function
main() {
    local number=$1

    # Compute the prime factors of the given number
    factors=$(compute_prime_factors "$number")

    # Print the prime factors
    echo "$factors"
}

# Execute main function with provided argument
main "$@"