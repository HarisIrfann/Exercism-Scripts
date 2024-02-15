#!/bin/bash

declare -A allergens=(
    ["eggs"]=1
    ["peanuts"]=2
    ["shellfish"]=4
    ["strawberries"]=8
    ["tomatoes"]=16
    ["chocolate"]=32
    ["pollen"]=64
    ["cats"]=128
)

is_allergic() {

    local score=$1
    local item=$2

    if (( ($score & ${allergens[$item]}) > 0 ))
    then
         echo "true"
    else
        echo "false"
    fi

}
# Function to get list of all allergies
get_allergies() {
    local score=$1
    local allergies=""

    # Define the desired order of allergens
    ordered_allergens=("eggs" "peanuts" "shellfish" "strawberries" "tomatoes" "chocolate" "pollen" "cats")

    # Iterate over the ordered list of allergens to construct the list of allergies
    for item in "${ordered_allergens[@]}"; do
        if (( ($score & ${allergens[$item]}) > 0 )); then
            allergies+=" $item"
        fi
    done

    allergies=$(echo "$allergies" | tr -s ' ' | sed 's/^ *//;s/ *$//')

    echo "$allergies"
}
# Main function
main() {
    local score=$1
    local mode=$2
    local item=$3

    case "$mode" in
        "allergic_to")
            is_allergic $score "$item"
            ;;
        "list")
            get_allergies $score
            ;;
        *)
            echo "Invalid mode"
            exit 1
            ;;
    esac
}

main "$@"


