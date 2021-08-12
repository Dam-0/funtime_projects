#!/bin/bash

file="../results/192.168.92.137.json"
output_file="/tmp/test1"

readarray -t my_array < <(jq -c '.[]' $file)

let num=0
rm /tmp/test1 > /dev/null 2>&1

for i in "${my_array[@]}"; do 
    let num2=0
    jq -r ".[$num].RESULTS_EXPLOIT[]" $file | sed 's/[^{]//g' | awk '{ print length }' | sed '/^0/d' > /tmp/lorem
    index_num=$(wc -l /tmp/lorem | awk '{print $1}' )

    echo -e "\e[1;31mSearch Query:\e[0m" $(jq -r ".[$num].SEARCH" $file) >> $output_file
    
    echo "════════════════════════════════════════" >> $output_file
    echo -e "Version     Exploit"  >> $output_file


    until [[ $num2 == $index_num ]]; do
        sto=$(jq -r ".[$num].RESULTS_EXPLOIT[$num2].Title" $file)
        ned=$(jq -r ".[$num].RESULTS_EXPLOIT[$num2].Path" $file)
        echo "$sto" "$ned"  >> $output_file
        #printf "$res" '%s\n' "$ned" >> $output_file
        #paste <(printf %s "$sto") <(printf %s "$ned") >> $output_file

        num2=$(($num2+1))
    done
    echo \ >> $output_file
    num=$(($num+1)) 
done


# TODO
# 1. sed remove 1st /n and replace with " "
# 2. add search_query to test1
# 3. maybe more sed
# 4. actually format json to look nice