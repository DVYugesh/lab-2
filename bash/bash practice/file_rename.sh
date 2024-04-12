#!/bin/bash

# Create the "output" directory if it doesn't exist
mkdir -p output

# Today's date in the format ddmmyyyy
today=$(date "+%d%m%Y")

# Loop through all files with the pattern "{file name}{date}.jpg" in the current directory
for file in *${today}.jpg; do
    if [ -f "$file" ]; then
        # Extract the date part from the file name
        file_date=${file%.*}
        file_date=${file_date##*[a-zA-Z]}
        
        # Calculate the difference in days between today and the file date
        difference=$(( ($(date -d "$today" +%s) - $(date -d "$file_date" +%s)) / (60*60*24) ))
        
        # Rename the file based on the difference in days
        if [ $difference -eq 0 ]; then
            new_name="${file%.jpg}_today.jpg"
        elif [ $difference -ge 1 ] && [ $difference -le 7 ]; then
            new_name="${file%.jpg}_weekold.jpg"
        elif [ $difference -gt 7 ]; then
            new_name="${file%.jpg}_quiteold.jpg"
        fi

        # Move the file to the "output" directory with the new name
        mv "$file" "output/$new_name"
    fi
done

# Delete all files with dates after today's date
find . -type f -name '*[0-9][0-9][0-9][0-9]${today}.jpg' -delete
