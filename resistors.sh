#!/usr/bin/env bash

for i in {1..3} ; do
  case "${!i}" in
    black) digits+=(0) ;;
    brown) digits+=(1) ;;
    red) digits+=(2) ;;
    orange) digits+=(3) ;;
    yellow) digits+=(4) ;;
    green) digits+=(5) ;;
    blue) digits+=(6) ;;
    violet) digits+=(7) ;;
    grey) digits+=(8) ;;
    white) digits+=(9) ;;
    *) echo smth >&2 ; exit 1
  esac
done

value=$(( (digits[0] * 10 + digits[1]) * 10**digits[2] ))

if [[ ${value: -9} = "000000000" ]]; then
  value=$((value / 1000000000)) ; multi="giga"
elif [[ ${value: -6} = "000000" ]]; then
  value=$((value / 1000000)) ; multi="mega"
elif [[ ${value: -3} = "000" ]] ; then
  value=$((value / 1000)) ; multi="kilo"
fi

echo "$value ${multi}ohms"