#!/bin/bash

file="results/192.168.92.137.json"

rm /tmp/test
readarray -t my_array < <(jq -c '.[]' $file)

for item in "${my_array[@]}";do
    search_query=$(jq '.SEARCH' <<< "$item")
    search_results=$(jq '.RESULTS_EXPLOIT[]."Title"' <<< "$item")
    exploit_location$(jq '.RESULTS_EXPLOIT[]."Path"' <<< "$item")
    echo "Search Query:" $search_query >> /tmp/test
    echo "Results: $search_results    Exploit_location: $exploit_location /n" >> /tmp/test

done

