#!/usr/bin/env bash

# Function to recite a verse of the nursery rhyme
recite_verse() {
    local verse_number=$1
    case $verse_number in
        1)
            echo "This is the house that Jack built." ;;
        2)
            echo "This is the malt"
            echo "that lay in the house that Jack built." ;;
        3)
            echo "This is the rat"
            echo "that ate the malt"
            echo "that lay in the house that Jack built." ;;
        4)
            echo "This is the cat"
            echo "that killed the rat"
            echo "that ate the malt"
            echo "that lay in the house that Jack built." ;;
        5)
            echo "This is the dog"
            echo "that worried the cat"
            echo "that killed the rat"
            echo "that ate the malt"
            echo "that lay in the house that Jack built." ;;
        6)
            echo "This is the cow with the crumpled horn"
            echo "that tossed the dog"
            echo "that worried the cat"
            echo "that killed the rat"
            echo "that ate the malt"
            echo "that lay in the house that Jack built." ;;
        7)
            echo "This is the maiden all forlorn"
            echo "that milked the cow with the crumpled horn"
            echo "that tossed the dog"
            echo "that worried the cat"
            echo "that killed the rat"
            echo "that ate the malt"
            echo "that lay in the house that Jack built." ;;
        8)
            echo "This is the man all tattered and torn"
            echo "that kissed the maiden all forlorn"
            echo "that milked the cow with the crumpled horn"
            echo "that tossed the dog"
            echo "that worried the cat"
            echo "that killed the rat"
            echo "that ate the malt"
            echo "that lay in the house that Jack built." ;;
        9)
            echo "This is the priest all shaven and shorn"
            echo "that married the man all tattered and torn"
            echo "that kissed the maiden all forlorn"
            echo "that milked the cow with the crumpled horn"
            echo "that tossed the dog"
            echo "that worried the cat"
            echo "that killed the rat"
            echo "that ate the malt"
            echo "that lay in the house that Jack built." ;;
        10)
            echo "This is the rooster that crowed in the morn"
            echo "that woke the priest all shaven and shorn"
            echo "that married the man all tattered and torn"
            echo "that kissed the maiden all forlorn"
            echo "that milked the cow with the crumpled horn"
            echo "that tossed the dog"
            echo "that worried the cat"
            echo "that killed the rat"
            echo "that ate the malt"
            echo "that lay in the house that Jack built." ;;
        11)
            echo "This is the farmer sowing his corn"
            echo "that kept the rooster that crowed in the morn"
            echo "that woke the priest all shaven and shorn"
            echo "that married the man all tattered and torn"
            echo "that kissed the maiden all forlorn"
            echo "that milked the cow with the crumpled horn"
            echo "that tossed the dog"
            echo "that worried the cat"
            echo "that killed the rat"
            echo "that ate the malt"
            echo "that lay in the house that Jack built." ;;
        12)
            echo "This is the horse and the hound and the horn"
            echo "that belonged to the farmer sowing his corn"
            echo "that kept the rooster that crowed in the morn"
            echo "that woke the priest all shaven and shorn"
            echo "that married the man all tattered and torn"
            echo "that kissed the maiden all forlorn"
            echo "that milked the cow with the crumpled horn"
            echo "that tossed the dog"
            echo "that worried the cat"
            echo "that killed the rat"
            echo "that ate the malt"
            echo "that lay in the house that Jack built." ;;
        *)
            echo "invalid verse number: $verse_number" >&2
            exit 1 ;;
    esac
}

# Main script logic
main() {
    local start_verse=$1
    local end_verse=$2
    # Check if the provided verse numbers are valid
    if (( start_verse < 1 || start_verse > 12 || end_verse < 1 || end_verse > 12 )); then
        echo "invalid verse numbers. Please provide verse numbers between 1 and 12." >&2
        exit 1
    fi
    local verse
    for (( verse = start_verse; verse <= end_verse; verse++ )); do
        recite_verse "$verse"
        echo
    done
}

# Execute the main function with the provided verse numbers
main "$@"
