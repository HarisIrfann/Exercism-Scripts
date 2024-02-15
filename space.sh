#!/bin/bash
set -x

planet=$1
age=$2
earth_seconds=31557600

case "$planet" in
    Mercury) multiplier=0.2408467 ;;
    Venus) multiplier=0.61519726 ;;
    Earth) multiplier=1 ;;
    Mars) multiplier=1.8808158 ;;
    Jupiter) multiplier=11.862615 ;;
    Saturn) multiplier=29.447498 ;;
    Uranus) multiplier=84.016846 ;;
    Neptune) multiplier=164.79132 ;;
    *) echo 'not a planet' && exit 1 ;;
esac

printf '%.2f\n' "$(bc -l <<<"$age / $multiplier / $earth_seconds")"