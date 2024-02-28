#!/usr/bin/env bash

main() {
    number=$1
    count=0
    while (( number )); do
        ((number & 1)) && (( count++ ))
        (( number >>= 1 ))
    done
    echo $count
}
main "$@"
