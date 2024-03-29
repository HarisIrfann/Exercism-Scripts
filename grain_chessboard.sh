#!/bin/bash

# Function to calculate the number of grains on a given square
grains_on_square() {
    local square=$1
    echo "$((2 ** (square - 1)))"
}

# Function to calculate the total number of grains on the chessboard up to a given number of squares
total_grains_up_to_square() {
    local square=$1
    local total=0
    for ((i = 1; i <= square; i++)); do
        total=$(( total + $(grains_on_square "$i" )))
    done
    echo "$total"
}

# Main script
read -r -p "Enter the square number (1-64): " square_number
if (( square_number < 1 || square_number > 64 )); then
    echo "Invalid square number. Please enter a number between 1 and 64."
    exit 1
fi

grains_on_given_square=$(grains_on_square "$square_number")
total_grains_up_to_given_square=$(total_grains_up_to_square "$square_number")

echo "Grains on square $square_number: $grains_on_given_square"
echo "Total grains on the chessboard up to square $square_number: $total_grains_up_to_given_square"


# #!/bin/bash
# square=$1
# total=0
# # Check if the input is "total"
# if [[ $square == "total" ]]; then
#     for (( i=1; i<=64; i++ )); do
#         grains=$(bc <<< "2^($i - 1)")
#         total=$(bc <<< "$total + $grains")
#     done
#     echo "$total"
#     exit 0
# fi
# # Check if the input is a valid integer between 1 and 64
# if ! [[ $square =~ ^[0-9]+$ ]]; then
#     echo "Error: invalid input"
#     exit 1
# fi
# if (( square < 1 || square > 64 )); then
#     echo "Error: invalid input"
#     exit 1
# fi
# # Calculate the grains on the given square
# grains=$(bc <<< "2^($square - 1)")
# echo "$grains"
