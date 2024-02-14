#!/bin/bash
str1="Sure."
str2="Whoa, chill out!"
str3="Calm down, I know what I'm doing!"
str4="Fine. Be that way!"
str5="Whatever."
input="$1"
# Check if the input is only whitespace
if [[ -z "${input//[$'\t\r\n ']/}" ]]; then
    echo "$str4"
    exit
fi
# Remove trailing whitespaces
input="${input%"${input##*[![:space:]]}"}"
# Check if the last character is a question mark
if [[ "${input: -1}" == "?" ]]; then
    # Check if the input is all uppercase
    if [[ "$input" == "${input^^}" && "$input" != "${input,,}" ]]; then
        echo "$str3"
    else
        echo "$str1"
    fi
else
    # Check if the input is all uppercase
    if [[ "$input" == "${input^^}" && "$input" != "${input,,}" ]]; then
        echo "$str2"
    else
        echo "$str5"
    fi
fi