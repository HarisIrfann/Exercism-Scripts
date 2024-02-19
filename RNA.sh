#!/usr/bin/env bash

# # Function to translate RNA sequence into protein
# translate_rna() {
#     local rna=$1
#     local codon=${rna:0:3}
#     local protein=""

#     # Check for empty RNA sequence
#     if [ -z "$rna" ]; then
#         echo ""
#         return
#     fi
#      if [[ $rna == *-* ]]; then
#         echo "Invalid codon" >&2
#         exit 1
#     fi

    
#     # Check for invalid codons
#     if [[ ! "$codon" =~ ^(AUG|UUU|UUC|UUA|UUG|UCU|UCC|UCA|UCG|UAU|UAC|UGU|UGC|UGG|UAA|UAG|UGA)$ ]]; then
#         echo "Invalid codon" >&2
#         exit 1
#     fi

#     # Check for stop codons
#     while [[ "$codon" != "UAA" && "$codon" != "UAG" && "$codon" != "UGA" ]]; do
#         case $codon in
#             "AUG") protein+="Methionine";;
#             "UUU"|"UUC") protein+="Phenylalanine";;
#             "UUA"|"UUG") protein+="Leucine";;
#             "UCU"|"UCC"|"UCA"|"UCG") protein+="Serine";;
#             "UAU"|"UAC") protein+="Tyrosine";;
#             "UGU"|"UGC") protein+="Cysteine";;
#             "UGG") protein+="Tryptophan";;
#         esac

#         # Move to the next codon
#         rna=${rna:3}
#         codon=${rna:0:3}

#         # If no more codons, break the loop
#         [ -z "$codon" ] && break

#         # Separate proteins with whitespace if there are more
#         protein+=" "
#     done

#     # Trim any trailing whitespace
#     protein=$(echo "$protein" | sed 's/[[:space:]]*$//')
#     echo "$protein"
# }

# # Main script starts here
# rna=$1

# # Call the function to translate RNA to protein
# translate_rna "$rna"


# error(){
# echo "Invalid codon"
# exit 1
# }
# input=$1
# len=${#input}

# for(( i=0 ; i < $len/3 ; i++ )){
#     protien+=(${input:i*3:3})
# }
# #echo ${protien[@]}
# for i in ${protien[@]}; do
# #echo $i
# case $i in
# AUG)
#     output+=(Methionine)
#     ;;
# UUU|UUC)
#     output+=(Phenylalanine)
#     ;;
# UUA|UUG)
#     output+=(Leucine)
#     ;;
# UCU|UCC|UCA|UCG)
#     output+=(Serine)
#     ;;
# UAU|UAC)
#     output+=(Tyrosine)
#     ;;
# UGU|UGC)
#     output+=(Cysteine)
#     ;;
# UGG)
#     output+=(Tryptophan)
#     ;;
# UAA|UAG|UGA)
#     echo ${output[@]}
#     exit 0
#     ;;
# *)
#     error
#     ;;
# esac
# done

# if (( $len%3 !=0 )); then 
# error
# fi
# echo ${output[@]}



translator() {
    case $1 in
        AUG             ) echo "Methionine";;
        UUU|UUC         ) echo "Phenylalanine";;
        UUA|UUG         ) echo "Leucine";;
        UCU|UCC|UCA|UCG ) echo "Serine";;
        UAU|UAC         ) echo "Tyrosine";;
        UGU|UGC         ) echo "Cysteine";;
        UGG             ) echo "Tryptophan";;
        UAA|UAG|UGA     ) echo "STOP";;
        *               ) echo "Invalid codon";;
    esac
}

main() {
  declare -a protein
  rnaseq="$1"
  while [[ -n "${rnaseq}" ]]; do
    pop3="${rnaseq:0:3}"
    translated=$(translator "$pop3")
    if [[ $translated =~ "Invalid" ]]; then
      echo "$translated"
      exit 1
    elif [[ $translated =~ "STOP" ]]; then
      echo "${protein[@]}"
      exit
    else
      protein=( "${protein[@]}" "$translated" )
    fi
    rnaseq="${rnaseq:3}"
  done
  echo "${protein[@]}"
  
}


# exit when blank
[[ -z $1 ]] && exit
main "$1"
