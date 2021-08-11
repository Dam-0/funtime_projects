#!/bin/bash

file="results/192.168.92.137.json"

rm /tmp/test
readarray -t my_array < <(jq -c '.[]' $file)

for item in "${my_array[@]}";do
    search_query=$(jq '.SEARCH' <<< "$item")
    search_results=$(jq '.RESULTS_EXPLOIT[]."Title"' <<< "$item")
    exploit_location=$(jq '.RESULTS_EXPLOIT[]."Path"' <<< "$item")
    echo "Search Query:" $search_query >> /tmp/test
    echo "Results: $search_results" >> /tmp/test
    echo "Exploit_location: $exploit_location" >> /tmp/test

done

let num=0
rm test1 > /dev/null 2>&1
rm test2 > /dev/null 2>&1

#for i in "${my_array[@]}"; do 
#    let num2=0
#    until [[ $num2 == $(jq -r ".[$num].RESULTS_EXPLOIT[] | length" $file) ]]; do
#        jq -r ".[$num].RESULTS_EXPLOIT[$num2].Title" $file >> test1
#        jq -r ".[$num].RESULTS_EXPLOIT[$num2].Path" $file >> test2
#        echo $num2
#        num2=$(($num2+1))
#    done
#    num=$(($num+1)) 
#done

#jq -r ".[0].RESULTS_EXPLOIT[]" $file | sed 's/[^{]//g' | awk '{ print length }'

jq -r ".[1].RESULTS_EXPLOIT" $file > /tmp/fuck
awk -F\{ '{print NF-1}' /tmp/fuck