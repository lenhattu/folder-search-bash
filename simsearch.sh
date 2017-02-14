#!/bin/bash

#init array
array=()

#find folders and fill results in array
while read -r folder; do
    array=("${array[@]}" "$folder")
done < <(find "$1" -type d -name "sim*") 

#trim path and display array
for i in "${!array[@]}"; do
    path="${array[$i]}"
    truncated_path="${path##"$1"}"
    printf "%s %s\n" "$i" "$truncated_path"
done

#user choice
read -p "Enter the number: " choice

#get the suffix and display
prefix="${array[choice]}"
suffix="${prefix##*/sim}"
echo $suffix
