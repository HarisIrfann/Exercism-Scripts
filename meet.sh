#!/bin/bash

# Function to find the date of the recurring meetup
find_meetup_date() {
    local year="$1"
    local month="$2"
    local descriptor="$3"
    local weekday="$4"

    # Convert descriptor to lowercase for easier comparison
    descriptor_lower=$(echo "$descriptor" | tr '[:upper:]' '[:lower:]')

    # Calculate the day of the week for the 1st of the given month
    first_day=$(date -d "$year-$month-01" +"%A")

    # Determine the offset for the desired weekday
    case "$weekday" in
        Monday) offset=0;;
        Tuesday) offset=1;;
        Wednesday) offset=2;;
        Thursday) offset=3;;
        Friday) offset=4;;
        Saturday) offset=5;;
        Sunday) offset=6;;
        *) echo "Invalid weekday"; exit 1;;
    esac

    # Calculate the date of the meetup based on the descriptor
    case "$descriptor_lower" in
        first) echo $(date -d "$year-$month-01 + $offset days" +"%Y-%m-%d");;
        second) echo $(date -d "$year-$month-01 + $((7 + offset)) days" +"%Y-%m-%d");;
        third) echo $(date -d "$year-$month-01 + $((14 + offset)) days" +"%Y-%m-%d");;
        fourth) echo $(date -d "$year-$month-01 + $((21 + offset)) days" +"%Y-%m-%d");;
        last) last_day=$(cal "$month" "$year" | awk 'NF {DAYS = $NF}; END {print DAYS}'); echo $(date -d "$year-$month-$last_day - $((6 - offset)) days" +"%Y-%m-%d");;
        teenth) echo $(date -d "$year-$month-13 + $offset days" +"%Y-%m-%d");;
        *) echo "Invalid descriptor"; exit 1;;
    esac
}

# Example usage
find_meetup_date "$@"
