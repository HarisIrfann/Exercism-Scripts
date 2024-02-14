#!/bin/bash
# Function to check if a number is an Armstrong number
is_armstrong() {
    num=$1
    sum=0
    len=${#num}
    # Loop through each digit of the number
    for ((i = 0; i < len; i++)); do
        digit=${num:i:1}
        sum=$((sum + digit ** len))
    done
    # Check if the sum equals the original number
    if [ $sum -eq "$num" ]; then
        echo "$num is an armstrong number"
    else
        echo "$num is not an armstrong number"
    fi
}
# Main script
is_armstrong "$1"