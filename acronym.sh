#!/usr/bin/env bash


if [[ -z "$1" ]]; then
    read -p "Enter the string:"
else
	str1=$1
fi

modified_str=$(echo "$str1" | sed 's/-/ /g; s/[;:,.?!@]/ /g')
echo "$modified_str"
result=""

for i in $modified_str
do
	result+="${i:0:1}"
done

echo "$result"
