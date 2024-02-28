#!/bin/bash

# Define a stack to store values
declare -a stack

# Define a dictionary to store word definitions
declare -A dictionary

# Function to push a number onto the stack
push() {
    stack+=($1)
}

# Function to perform addition
add() {
    local a=${stack[-2]}
    local b=${stack[-1]}
    stack=("${stack[@]:0:${#stack[@]}-2}")
    stack+=($((a + b)))
}

# Function to perform subtraction
subtract() {
    local a=${stack[-2]}
    local b=${stack[-1]}
    stack=("${stack[@]:0:${#stack[@]}-2}")
    stack+=($((a - b)))
}

# Function to perform multiplication
multiply() {
    local a=${stack[-2]}
    local b=${stack[-1]}
    stack=("${stack[@]:0:${#stack[@]}-2}")
    stack+=($((a * b)))
}

# Function to perform division
divide() {
    local a=${stack[-2]}
    local b=${stack[-1]}
    if [ $b -eq 0 ]; then
        echo "divide by zero" >&2
        exit 1
    fi
    stack=("${stack[@]:0:${#stack[@]}-2}")
    stack+=($((a / b)))
}

# Function to duplicate the top element of the stack
duplicate() {
    stack+=(${stack[-1]})
}

# Function to drop the top element of the stack
drop() {
    unset 'stack[${#stack[@]}-1]'
}

# Function to swap the top two elements of the stack
swap() {
    local tmp=${stack[-1]}
    stack[-1]=${stack[-2]}
    stack[-2]=$tmp
}

# Function to duplicate the second element from the top of the stack
over() {
    stack+=(${stack[-2]})
}

# Function to define a new word
define_word() {
    local word_name=$1
    local definition=$2
    dictionary[$word_name]="$definition"
}

# Function to evaluate Forth code
evaluate() {
    local code="$1"
    local words=($code)

    for word in "${words[@]}"; do
        if [[ ${dictionary[$word]+exists} ]]; then
            evaluate "${dictionary[$word]}"
        elif [[ $word =~ ^[0-9]+$ ]]; then
            push $word
        else
            case $word in
                "+") add;;
                "-") subtract;;
                "*") multiply;;
                "/") divide;;
                "DUP") duplicate;;
                "DROP") drop;;
                "SWAP") swap;;
                "OVER") over;;
                ":") local word_name=${words[$i+1]}; local definition=""; local i=$((i+2));;
                ";") define_word $word_name $definition; definition="";;
                *) definition+=" $word";;
            esac
        fi
    done
}

# Main program
main() {
    local input=$1
    evaluate "$input"
    echo "${stack[@]}"
}

# Call main function with input
main "$@"
