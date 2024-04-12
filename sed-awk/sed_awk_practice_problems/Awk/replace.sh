input=$1
paragraph=$2
names=( $(awk -F: '{print $1}' $input) )
roll=( $(awk -F: '{print $2}' $input ) )
for ((i=0;i<${#names[@]}-1;i=i+1))
do sed -e "s/student_name/${names[i]}/g" -e "s/roll_no/${roll[i]}/g" $paragraph
echo  ""
done
sed -e "s/student_name/${names[${#names[@]}-1]}/g" -e "s/roll_no/${roll[${#names[@]}-1]}/g" $paragraph