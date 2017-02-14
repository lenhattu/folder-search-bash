#!/bin/bash

#init array
array=()

#find folders and fill results in array
while read -r folder; do
    array=("${array[@]}" "$folder")
done < <(find /Users/tule/Dropbox/Research/Bioinformatics/Practice/targetA -type d -name "sim*") 

#display array
for i in "${!array[@]}"; do
    printf "%s %s\n" "$i" "${array[$i]}"
done

#user choice
read -p "Enter the number: " choice

#get the suffix and display
prefix="${array[choice]}"
suffix="${p##*/sim}"
echo $suffix
