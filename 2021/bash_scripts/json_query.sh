#!/bin/bash

file="results/192.168.92.137.json"

rm /tmp/test
readarray -t my_array < <(jq -c '.[]' $file)

let num=0
rm /tmp/test1 > /dev/null 2>&1
rm /tmp/test2 > /dev/null 2>&1

for i in "${my_array[@]}"; do 
    let num2=0
    jq -r ".[$num].RESULTS_EXPLOIT[]" $file | sed 's/[^{]//g' | awk '{ print length }' | sed '/^0/d' > /tmp/fuck
    index_num=$(wc -l /tmp/fuck | awk '{print $1}' )
    echo $index_num
    until [[ $num2 == $index_num ]]; do
        jq -r ".[$num].RESULTS_EXPLOIT[$num2].Title" $file >> /tmp/test1
        jq -r ".[$num].RESULTS_EXPLOIT[$num2].Path" $file >> /tmp/test2
        num2=$(($num2+1))
    done
    num=$(($num+1)) 
done