#!/bin/bash

# Function to translate a single word to Pig Latin
translate_to_piglatin() {
    word="$1"
    case "$word" in
        # Rule 1: If word starts with a vowel or 'x' or 'y' followed by a consonant, add "ay" at the end.
        [aeiou]* | [xy][^aeiou]*)
            echo "${word}ay"
            ;;
        # Rule 3: If word starts with consonant followed by 'qu', move 'qu' to the end and add "ay".
        [^aeiou]*qu*)
            echo "${word#*qu}${word%qu*}ay"
            ;;
        # Rule 2: If word starts with consonant(s), move them to the end and add "ay".
        *)
            echo "${word:1}${word:0:1}ay"
            ;;
    esac
}

# Function to translate a string of text to Pig Latin
translate_text_to_piglatin() {
    input="$*"
    # Split the input into words
    words=($input)
    # Loop through each word and translate it to Pig Latin
    for word in "${words[@]}"; do
        translate_to_piglatin "$word"
    done
}

# Translate the given input arguments to Pig Latin
translate_text_to_piglatin "$@"
