#!/bin/bash

input="${1,,}"
words=$(grep -Po "[a-z]+(?:'[a-z]+)?|[0-9]+" <<< "$input")
declare -A counter

while read -r line; do
    counter["$line"]=$((${counter[$line]:-0} + 1))
done <<< "$words"

for word in "${!counter[@]}"; do
    echo "$word: ${counter[$word]}"
done 