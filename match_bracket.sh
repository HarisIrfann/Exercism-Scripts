#!/bin/bash
input=$1
stack=()
for (( i = 0; i < ${#input}; i++ )); do
    char=${input:i:1}
    case $char in
        '[' | '{' | '(')
            stack+=("$char")
            ;;
        ']')
            if [[ ${#stack[@]} -eq 0 || ${stack[-1]} != '[' ]]; then
                echo "false"
                exit 0
            fi
            stack=("${stack[@]::${#stack[@]}-1}")
            ;;
        '}')
            if [[ ${#stack[@]} -eq 0 || ${stack[-1]} != '{' ]]; then
                echo "false"
                exit 0
            fi
            stack=("${stack[@]::${#stack[@]}-1}")
            ;;
        ')')
            if [[ ${#stack[@]} -eq 0 || ${stack[-1]} != '(' ]]; then
                echo "false"
                exit 0
            fi
            stack=("${stack[@]::${#stack[@]}-1}")
            ;;
    esac
done
if [[ ${#stack[@]} -eq 0 ]]; then
    echo "true"
else
    echo "false"
fi
exit 0