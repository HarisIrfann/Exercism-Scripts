#!/usr/bin/env bash

# Main function to generate secret handshake actions
secret_handshake() {
    local num="$1"
    local actions=("wink" "double blink" "close your eyes" "jump")
    local handshake=""

    for (( i = 0; i < 5; i++ )); do
        if (( num & (1 << i) )); then
            handshake="${actions[$i]}, $handshake"
        fi
    done

    (( num & 16 )) && actions=($(echo "${actions[@]}" | tac))
    echo "${handshake%, }"
}

# Validate input argument
if (( $# != 1 )) || (( $1 < 1 )) || (( $1 > 31 )); then
    echo "Usage: $0 <number between 1 and 31>"
    exit 1
fi

# Call the main function with the input number
secret_handshake "$1"
