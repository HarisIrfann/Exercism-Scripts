#!/usr/bin/env bash

# Function to clean up a phone number
clean_phone_number() {
    # Remove all non-digit characters
    local cleaned_number=$(echo "$1" | tr -cd '[:digit:]')

    # Remove leading "1" or "+1" if present
    if [[ ${cleaned_number:0:1} == "1" ]]; then
        cleaned_number=${cleaned_number:1}
    elif [[ ${cleaned_number:0:2} == "+1" ]]; then
        cleaned_number=${cleaned_number:2}
    fi

    # Check if the cleaned number has a valid length
    if [[ ${#cleaned_number} -eq 10 ]]; then
        # Check if area code starts with 0 or 1
        if [[ ${cleaned_number:0:1} == "0" || ${cleaned_number:0:1} == "1" ]]; then
            echo "Invalid number.  [1]NXX-NXX-XXXX N=2-9, X=0-9" >&2
            exit 1
        fi
        
        # Check if exchange code starts with 0 or 1
        if [[ ${cleaned_number:3:1} == "0" || ${cleaned_number:3:1} == "1" ]]; then
            echo "Invalid number.  [1]NXX-NXX-XXXX N=2-9, X=0-9" >&2
            exit 1
        fi

        echo "$cleaned_number"
    else
        echo "Invalid number.  [1]NXX-NXX-XXXX N=2-9, X=0-9" >&2
        exit 1
    fi
}

# Main script logic
main() {
    local phone_number=$1
    clean_phone_number "$phone_number"
}

# Execute the main function with the provided phone number
main "$@"
