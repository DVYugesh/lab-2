#!/bin/bash

# Function to combine csv files into main.csv
function combine {
    # List all csv files except 'main.csv'
    files=($(ls *.csv | grep -v 'main.csv'))

    # Create the header for 'main.csv'
    echo "Roll_Number,Name,$(echo "${files[@]%.csv}" | tr ' ' ',')" > main.csv

    # Determine the number of fields in 'main.csv'
    no_of_fields=$(awk -F',' 'NR==1 {print NF}' "main.csv")

    # Iterate over each csv file
    for file in "${files[@]}"; do

        # Extract the field name from the csv file name
        field=$(basename "$file" .csv)
        # Find the field number in 'main.csv' corresponding to the extracted field name
        field_number=$(awk -F',' -v field="$field" 'NR==1 {for (i=1; i<=NF; i++) {if ($i == field) {print i; exit}}}' main.csv)
        
        # Add a newline character at the end of a file if it does not have one
        if [ "$(tail -c1 $file)" != "$(echo -n "")" ]; then echo >> $file; fi

        # Read each line from the csv file (excluding the header) and storing the fields in variables
        sed -n '2,$p' $file | while IFS=',' read -r roll_number name marks; do
            #echo $name
            found=0
            line_number=0 # Stores the line number at which we are in main.csv

            # Check if the roll number exists in 'main.csv' by matching roll number
            while IFS=',' read -r r_n n; do
                ((line_number++))
                if [ "$roll_number" = "$r_n" ]; then
                    found=1
                    break
                fi
            done < "main.csv"

            # If the roll number is not found,
            if [ "$found" -eq 0 ]; then
                #add a new line to 'main.csv' to add data of new student(exam marks data is empty for now in the line created)
                ((line_number++))
                new_line="$roll_number,$name"
                for ((i = 3; i <= no_of_fields; i++)); do
                    new_line="$new_line,"
                done
                echo "$new_line" >> main.csv

                # Adding marks at a particular field position in the new line created
                awk -v line="$line_number" -v field="$field_number" -v num="$marks" -F ',' '{
                    if (NR == line) {
                        for (i=1; i<=NF; i++) {
                          if (i == field) {
                            $i = $i + num
                          }
                          printf "%s", $i
                          if (i < NF) {
                            printf ","
                          }
                        }
                        printf "\n"
                    }   
                    else {
                      print
                    }
                }' "main.csv" > temp.csv && mv temp.csv "main.csv"
            
            # If the roll number is found 
            else
                # Adding marks at a particular field position in the line we found the roll number
                awk -v line="$line_number" -v field="$field_number" -v num="$marks" -F ',' '{
                    if (NR == line) {
                        for (i=1; i<=NF; i++) {
                          if (i == field) {
                            $i = $i + num
                          }
                          printf "%s", $i
                          if (i < NF) {
                            printf ","
                          }
                        }
                        printf "\n"
                    } 
                    else {
                        print
                    }
                }' "main.csv" > temp.csv && mv temp.csv "main.csv"
            fi

        done
    done

    # Replacing all empty fields with a in main.csv
    sed -i -e "s/,,/,a,/g" -e "s/,$/,a/g" main.csv 
    
}

# Call the combine function
combine

function upload {
    
    # File path is given as first argument to the function
    file_path=$1
    cp "$file_path" .

}

#upload "$2"


