#!/bin/bash

#init array and variables
array=()
length=0
selectMsg="Please select one of this:"
errorMsg="Bad input! Please try again..."

#check if the argument is a valid directory
if ! [[ -d ${!#} ]]; then
    echo "Invalid argument!"
    exit 1;
fi

#find folders and fill results in array
while read -r folder; do
    #add to array
    array=("${array[@]}" "$folder")
    #number of elements
    ((length++))
done < <(find "$1" -type d -name "sim*" | sort)

#trim path and display array
echo $selectMsg
for i in "${!array[@]}"; do
    #full path to folder
    path="${array[$i]}"
    #truncate path
    truncated_path=.../"${path##"$1"/}"
    #print index + truncated path
    printf "%s %s\n" "$i" "$truncated_path"
done

#user choice and result
while true
do
    #get user input
    read -p "Enter the number: " choice
    #validate
    if [[ "$choice" =~ ^[0-9]+$ ]]; then     #if it is a non-negative int
        if [ "$choice" -ge "$length" ]; then #if it is out of range
            echo $errorMsg;
        else
            #get the suffix and display
            prefix="${array[choice]}"
            suffix="${prefix##*/sim}"
            echo $suffix
            exit 0; #Done! Exit script.
        fi
    else #if it is a negative int or char
        echo $errorMsg;
    fi
done
