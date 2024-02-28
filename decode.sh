#!/bin/bash

# Run-length encoding function
encode() {
    local input="$1"
    local encoded=""
    local count=1
    local prev=""

    for (( i = 0; i < ${#input}; i++ )); do
        current="${input:i:1}"
        if [[ "$current" == "$prev" ]]; then
            (( count++ ))
        else
            if [[ -n "$prev" ]]; then
                if (( count == 1 )); then
                    encoded+="$prev"
                else
                    encoded+="$count$prev"
                fi
            fi
            count=1
            prev="$current"
        fi
    done

    if [[ -n "$prev" ]]; then
        if (( count == 1 )); then
            encoded+="$prev"
        else
            encoded+="$count$prev"
        fi
    fi

    echo "$encoded"
}

# Run-length decoding function
decode() {
    local input="$1"
    local decoded=""
    local count=""

    for (( i = 0; i < ${#input}; i++ )); do
        char="${input:i:1}"
        if [[ "$char" =~ [0-9] ]]; then
            count+="$char"
        else
            if [[ -n "$count" ]]; then
                decoded+=$(printf "%0.s$char" $(seq 1 $count))
                count=""
            else
                decoded+="$char"
            fi
        fi
    done

    echo "$decoded"
}

# Main function
main() {
    local operation="$1"
    local input="$2"

    case "$operation" in
        encode)
            encode "$input"
            ;;
        decode)
            decode "$input"
            ;;
        *)
            echo "Invalid operation. Usage: $0 encode|decode <input>"
            exit 1
            ;;
    esac
}

# Run main function if executed as a script
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main "$@"
fi
