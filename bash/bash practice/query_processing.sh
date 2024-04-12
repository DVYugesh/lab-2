#!/usr/bin/bash
query=$1
declare -a array
for ((i=2;i<=$#;i++));do
    array[${i}-1]=${!i}
done
found=0
for x in "${array[@]}"; do
    if [[ "$x" == "$query" ]]; then  
        found=1
        echo "Yes"
        break
    fi
done

if [[ $found -ne 1 ]]; then  
    echo "No"
fi
