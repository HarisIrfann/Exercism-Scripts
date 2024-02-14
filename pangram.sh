#!/usr/bin/env bash

is_pangram() {
    local sentence="$1"
    local alphabets="abcdefghijklmnopqrstuvwxyz"
    local seen=""

    # Convert the sentence to lowercase
    sentence=$(echo "$sentence" | tr '[:upper:]' '[:lower:]')

    # Iterate through each character in the sentence
    for (( i=0; i<${#sentence}; i++ )); do
        char="${sentence:i:1}"

        # Check if the character is a letter and not already seen
        if [[ "$char" =~ [a-z] ]] && [[ ! "$seen" =~ "$char" ]]; then
            seen+="$char"
        fi
    done

    # Check if all alphabets are seen in the sentence
    if [[ "${#seen}" -eq "${#alphabets}" ]]; then
        echo "The sentence is pangram"
    else 
        echo "The sentence is not pangram"
    fi
}

# Read input from the user
read -r -p "Enter the sentence: " input_sentence

# Call the function with the input sentence
is_pangram "$input_sentence"
