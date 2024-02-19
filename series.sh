#!/usr/bin/env bash

main() {
    local input="$1"
    local length="$2"
    local input_length="${#input}"
    
[[ -z $1 ]] && echo -e "series cannot be empty" && exit 1
[[ $2 -gt ${#1} ]] && echo "slice length cannot be greater than series length" && exit 1
[[ $2 -eq 0 ]] && echo "slice length cannot be zero" && exit 1
[[ $2 -lt 0 ]] && echo "slice length cannot be negative" && exit 1

    # # Check for empty series
    # if [ -z "$input" ]; then
    #     echo -e "series cannot be empty" && exit 1
    # fi

    # # Check for invalid slice length
    # if (( length <= 0 )); then
    #     echo "slice length cannot be zero" && exit 1
    # fi
    # [[ $2 -lt 0 ]] && echo "slice length cannot be negative" && exit 1
    # # Check for invalid input length
    # if (( input_length < length )); then
    #     echo "slice length cannot be greater than series length" && exit 1
    # fi

    local slices=()
    # Generate slices
    for (( i = 0; i <= input_length - length; i++ )); do
        slices+=( "${input:i:length}" )
    done

    # Output slices
    echo "${slices[@]}"
}

# Execute the main function with the provided input arguments
main "$@"

