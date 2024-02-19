#!/usr/bin/env bash

sentence()
{
	if (( $1 == 0 )); then
		echo -e "No more bottles of beer on the wall, no more bottles of beer.\nGo to the store and buy some more, 99 bottles of beer on the wall."
	elif (( $1 == 1 )); then
		echo -e "1 bottle of beer on the wall, 1 bottle of beer.\nTake it down and pass it around, no more bottles of beer on the wall."
	elif (( $1 == 2 )); then
		echo -e "2 bottles of beer on the wall, 2 bottles of beer.\nTake one down and pass it around, 1 bottle of beer on the wall."
	else
		(( k = $1 - 1 ))
		echo -e "$1 bottles of beer on the wall, $1 bottles of beer.\nTake one down and pass it around, $k bottles of beer on the wall."
	fi
}

main()
{
	if (( $# < 1 || $# > 2 )); then
		echo "Error: 1 or 2 arguments expected"
		return 1

	elif (( $# == 1 )); then
		echo -e "$(sentence $1)"

	elif (( $1 < $2 )); then
		echo "Start must be greater than End"
		return 1

	else
		for (( i=$1; i>=$2; --i )); do
			echo -e "$(sentence $i)\n"
		done
	fi
}

main "$@"