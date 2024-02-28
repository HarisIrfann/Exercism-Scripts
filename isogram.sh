#!/usr/bin/env bash

# Validate input
if [[ $# -ne 1 ]]; then
    echo "Usage: secret_handshake <int>"
    exit 1
fi

# 0 <= x < 32
if [[ $1 -lt 0 || $1 -ge $((1<<5)) ]]; then
    echo "Input must be between 0 and 32"
    exit 1
fi

# Create output as array
readonly responseArr=('wink' 'double blink' 'close your eyes' 'jump' 'reverse')
declare outputArr
for((i="${#responseArr}"; i>=0; i--)); do
    if (( ($1>>i) & 1 )); then
        outputArr+=("${responseArr[i]}")
    fi
done

# Produce output string and reverse array if necessary
output=""
if [[ ${outputArr[0]} == 'reverse' ]]; then
    IFS=,
    echo "${outputArr[*]:1}"
else
    for elem in "${outputArr[@]}"; do
        output="${elem},${output}"
    done
    echo "${output%,}"
fi

exit 0
