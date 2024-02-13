#!/bin/bash

FREE_RAM=$(free -mt | grep "Total" | awk '{ print $4}')
TH=2000

if [[ $FREE_RAM -lt $TH ]]
then

        echo "WARNING! RAM is running low"
else
	echo "RAM is sufficient - $FREE_RAM M"
fi

