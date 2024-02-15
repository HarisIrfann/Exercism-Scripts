#!/usr/bin/env bash

claimed="$1"
a="$2"
b="$3"
c="$4"

is_valid_triangle () {
	local re='^-'
	[[ $(echo -e "$1\n$2\n$3" | sort -nr | paste -sd- | bc) =~ $re ]] && echo true || echo false
}

has_zero_side () {
	[[ $1 == '0' ]] || [[ $2 == '0' ]] || [[ $3 == '0' ]] && echo true || echo false
}



[[ $(is_valid_triangle $a $b $c) == 'false' ]] || [[ $(has_zero_side $a $b $c) == 'true' ]] && { echo false; exit; }

case $claimed in
	equilateral)
		[[ $a == $b ]] && [[ $b == $c ]] && echo true || echo false
	;;
	isosceles)
		[[ $a == $b ]] || [[ $b == $c ]] || [[ $a == $c ]] && echo true || echo false
	;;
	scalene)
		[[ $a != $b ]] && [[ $b != $c ]] && [[ $a != $c ]] && echo true || echo false
	;;
esac