#!/bin/bash

# Function to add one gigasecond to a given date
add_gigasecond() {
    local input_date="$1"
    local gigasecond=1000000000

    # Parse input date using GNU date command
    local epoch=$(date -u -d "$input_date" +"%s")

    # Add gigasecond to the epoch time
    local new_epoch=$((epoch + gigasecond))

    # Convert new epoch time to human-readable format
    local new_date=$(TZ=UTC printf '%(%Y-%m-%dT%H:%M:%S)T\n' "$new_epoch")

    echo "$new_date"
}

# Main script

# Check if input date includes time, if not, append 'T00:00:00' to specify midnight
if [[ "$1" != *"T"* ]]; then
    input_date="$1T00:00:00"
else
    input_date="$1"
fi

# Calculate the date after adding one gigasecond
add_gigasecond "$input_date"
