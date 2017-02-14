#!/bin/bash

array=()
while read -r folder; do
    array=("${array[@]}" "$folder")
done < <(find /Users/tule/Dropbox/Research/Bioinformatics/Practice/targetA -type d -name "sim*") 

for i in "${!array[@]}"; do
    printf "%s %s\n" "$i" "${array[$i]}"
done
