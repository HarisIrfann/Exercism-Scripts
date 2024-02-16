#!/bin/bash
#tput reset
invalid () {
	echo "$@"
	exit 1
}
numeric () {
	[[ $1 == ?([+-])+([[:digit:]]) ]]
}
operators () {
	[[ $1 == [+-] ]]
}
main () {
	(( $# == 2 || $# == 4 )) || invalid "invalid arguments"
	numeric "$1" || invalid "non numeric"
	numeric "$2" || invalid "non numeric"
	h=$1
	m=$2
	while [ $m -lt 0 ]; do
		(( m=$((m+60)), h=$((h-1)) ))
	done
	while [ $h -lt 0 ]; do
		(( h=$((h+24)) ))
	done
	min=$(( 60*h + m ))
	
    if [[ $3 == "+" || $3 == "-" ]]; then
        min=$(( min $3 $4 ))
    fi
    if [[ $4 ]]; then
        numeric "$4" || invalid ""  
    fi
	while [ $min -lt 0 ]; do
		min="$(( min+(24*60) ))"
	done
	
    h=$(( (min/60)%24 ))
    m=$((min%60))
	if [[ $h -eq 24 && $m -eq 60 ]]; then
         h=0; m=0
         echo "0$h:0$m"
    fi  
    if ! [[ -z $3 ]]; then
        operators "$3" || invalid "invalid arguments"
    fi
    if [[ $h -lt 10 && $m -lt 10 ]]; then
         echo "0$h:0$m"
    elif [[ $h -ge 10 && $m -lt 10 ]]; then
         echo "$h:0$m"
    elif [[ $h -lt 10 && $m -gt 10 ]]; then
         echo "0$h:$m"
    else
         echo "$h:$m"
    fi
}
main "$@"
