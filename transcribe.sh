#!/usr/bin/env bash

# Function to transcribe a single nucleotide to its RNA complement
transcribe() {
    local nucleotide=$1
    case $nucleotide in
        "G") echo "C" ;;
        "C") echo "G" ;;
        "T") echo "A" ;;
        "A") echo "U" ;;
        *) echo "Invalid nucleotide detected." >&2 && exit 1 ;;
    esac
}

# Main script logic
main() {
    local sequence=$1
    local transcribed=""

    # Iterate over each character in the sequence and transcribe it
    for ((i = 0; i < ${#sequence}; i++)); do
        # Check if the current nucleotide is valid
        case ${sequence:i:1} in
            [GCTA]) transcribed+=$(transcribe "${sequence:i:1}") ;;
            *) echo "Invalid nucleotide detected." >&2 && exit 1 ;;
        esac
    done

    echo "$transcribed"
}

# Execute the main function with the provided input
main "$@"
