#!/bin/bash

# Function to turn the robot right
turn_right() {
    case $direction in
        "north") direction="east" ;;
        "east") direction="south" ;;
        "south") direction="west" ;;
        "west") direction="north" ;;
    esac
}

# Function to turn the robot left
turn_left() {
    case $direction in
        "north") direction="west" ;;
        "west") direction="south" ;;
        "south") direction="east" ;;
        "east") direction="north" ;;
    esac
}

# Function to advance the robot
advance() {
    case $direction in
        "north") ((y++)) ;;
        "south") ((y--)) ;;
        "east") ((x++)) ;;
        "west") ((x--)) ;;
    esac
}

# Validate input parameters
validate_input() {
    if [[ $direction != "north" && $direction != "south" && $direction != "east" && $direction != "west" ]]; then
        echo "invalid direction"
        exit 1
    fi
    if [[ $instructions =~ [^RLA] ]]; then
        echo "invalid instruction"
        exit 1
    fi
}

# Parse input parameters
x=${1:-0}
y=${2:-0}
direction=${3:-north}
instructions=${4:-}

# Validate input
validate_input

# Execute instructions
for instruction in $(echo "$instructions" | sed 's/./&\n/g'); do
    case $instruction in
        "R") turn_right ;;
        "L") turn_left ;;
        "A") advance ;;
    esac
done

# Print final position and direction
echo "$x $y $direction"
