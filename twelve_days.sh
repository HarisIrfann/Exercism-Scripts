#!/usr/bin/env bash
# Uncomment for debugging
#set -x

gifts=(
    'twelve Drummers Drumming'
    'eleven Pipers Piping'
    'ten Lords-a-Leaping'
    'nine Ladies Dancing'
    'eight Maids-a-Milking'
    'seven Swans-a-Swimming'
    'six Geese-a-Laying'
    'five Gold Rings'
    'four Calling Birds'
    'three French Hens'
    'two Turtle Doves'
)

first=$1
last=$2

for (( i = first; i <= last; ++i )); do
    case $i in
        1) day=first ;;
        2) day=second ;;
        3) day=third ;;
        4) day=fourth ;;
        5) day=fifth ;;
        6) day=sixth ;;
        7) day=seventh ;;
        8) day=eighth ;;
        9) day=ninth ;;
        10) day=tenth ;;
        11) day=eleventh ;;
        12) day=twelfth ;;
    esac

    printf 'On the %s day of Christmas my true love gave to me: ' "$day"

    if (( i >= 2 )); then
        printf '%s' "${gifts[-i + 1]}"
        if (( i >= 3 )); then
            printf ', %s' "${gifts[@]: -i+2}"
        fi
        printf ', and '
    fi

    printf 'a Partridge in a Pear Tree.\n'
done