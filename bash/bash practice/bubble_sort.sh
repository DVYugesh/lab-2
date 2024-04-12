#!/usr/bin/bash

# Store positional parameters as strings in an array
array=("$@")

# Convert strings to integers
for (( i=0; i<"${#array[@]}"; i++ )); do
    array[i]=$((${array[$i]}))
done

# Bubble sort to sort the array and count inversions
let k=0
for ((i=0; i<$#-1; i++)); do
    for ((j=0; j<$#-i-1; j++)); do
        if [ ${array[$j]} -gt ${array[$j+1]} ]; then
            let k++
            # Swap elements
            temp=${array[j]}
            array[j]=${array[j+1]}
            array[j+1]=$temp
        fi
    done
done

# Print sorted array and count of inversions
echo "Sorted array: ${array[@]}"
echo "Number of inversions: $k"
