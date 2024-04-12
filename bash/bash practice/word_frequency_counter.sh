#!/usr/bin/bash
file=( $(cat $1) )
declare -A array
for x in "${file[@]}";do
   if [[ -v array["$x"] ]]; then
    let array["$x"]=${array["$x"]}+1
   else
    array["$x"]=1
   fi
done
for key in "${!array[@]}"; do
    echo "$key: ${array[$key]}"
done