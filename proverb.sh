#!/usr/bin/env bash

main() {
    if ! (( $# )); then
        echo ""
        exit
    fi

    if (( $# > 1 )); then
        for (( i=2; i <= $#; i++ )); do
            prev=$(($i-1))
            add_sentence "${!prev}" "${!i}"
        done
    fi
    
    add_end "$1"
    echo -e "$text"
}

add_sentence() {
    text="${text}For want of a $1 the $2 was lost.\n"
}

add_end() {
    text="${text}And all for the want of a $1."
}

main "$@"