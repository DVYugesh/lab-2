#!/usr/bin/bash

# Function to calculate the Catalan number recursively
calculate_catalan() {
    local n=$1

    # Base cases
    if [ $n -eq 0 ] || [ $n -eq 1 ]; then
        echo 1
        return
    fi

    local result=0
    # Calculate Catalan number using the recursive formula
    for (( i=0; i<n; i++ )); do
        local left=$(calculate_catalan $i)
        local right=$(calculate_catalan $(( n - i - 1 )))
        result=$(( result + left * right ))
    done

    echo $result
}

# Check if the number of arguments is valid
if [ $# -ne 1 ]; then
    echo "Usage: $0 <integer>"
    exit 1
fi

# Convert the argument to an integer
n=$1

# Check if the argument is a non-negative integer
if ! [[ $n =~ ^[0-9]+$ ]]; then
    echo "Error: Please provide a non-negative integer." >&2
    exit 1
fi

# Call the function to calculate the Catalan number
result=$(calculate_catalan $n)
echo "Catalan number for $n is: $result"
