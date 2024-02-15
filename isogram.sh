#!/usr/bin/env bash

input=$1

# Remove spaces, convert to lowercase, and preserve hyphens
cleaned=$(echo "$input" | tr -d '[:space:]' | tr '[:upper:]' '[:lower:]')

# Declare an associative array to count occurrences of each character
declare -A counts

# Iterate over each character in the cleaned string and count occurrences
for ((i = 0; i < ${#cleaned}; i++)); do
    char=${cleaned:i:1}
    if [[ "$char" != "-" ]]; then  # Skip hyphens
        (( counts[$char]++ ))
        if (( counts[$char] > 1 )); then
            echo "false"
            exit 0
        fi
    fi
done

echo "true"

