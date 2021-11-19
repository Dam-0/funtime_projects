#!/bin/bash

## TO DO
# Split json file into 4

## Checks if user used arguments
if [ -z $1 ]; then
    echo "Usage: json_parser.sh {input_file.json} {output_file.csv}"
    exit 1
elif [ ! -f $1 ]; then
    echo "Select a file"
    echo
    echo "Usage: json_parser.sh {input_file.json} {output_file.csv}"
    exit 1
else
    FILE=$1
fi

## Removes file extension from input file, and sets custom output
if [ -z $2 ]; then
    output_file="${1::-5}-sorted.csv"
else
    output_file=$2
fi

## Warns user to moves files
if [ -f $output_file ]; then
    echo "$output_file Detected."
    echo "Rename the file or specify a new file."
    exit 1
fi


function shutdown() {
  tput cnorm # reset cursor
}
trap shutdown EXIT

function cursorBack() {
  echo -en "\033[$1D"
}

function spinner() {
  local pid=$1 # Process Id of the previous running command
  local spin='-\|/'
  local charwidth=1

  local i=0
  tput civis # cursor invisible
  while kill -0 $pid 2>/dev/null; do
    local i=$(((i + $charwidth) % ${#spin}))
    printf "%s" "${spin:$i:$charwidth}"

    cursorBack 1
    sleep .1
  done
  tput cnorm
  wait $pid # capture exit code
  return $?
}



## Title
echo "
     ██╗███████╗ ██████╗ ███╗   ██╗             
     ██║██╔════╝██╔═══██╗████╗  ██║             
     ██║███████╗██║   ██║██╔██╗ ██║             
██   ██║╚════██║██║   ██║██║╚██╗██║             
╚█████╔╝███████║╚██████╔╝██║ ╚████║             
 ╚════╝ ╚══════╝ ╚═════╝ ╚═╝  ╚═══╝             
                                                
██████╗  █████╗ ██████╗ ███████╗███████╗██████╗ 
██╔══██╗██╔══██╗██╔══██╗██╔════╝██╔════╝██╔══██╗
██████╔╝███████║██████╔╝███████╗█████╗  ██████╔╝
██╔═══╝ ██╔══██║██╔══██╗╚════██║██╔══╝  ██╔══██╗
██║     ██║  ██║██║  ██║███████║███████╗██║  ██║
╚═╝     ╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝╚══════╝╚═╝  ╚═╝
(Multi-Threaded Edition)"



## Varibles for colours
red=$'\e[1;31m'
grn=$'\e[1;32m'
blu=$'\e[1;34m'
end=$'\e[0m'


## Delcares four arrays (4 threads)
declare -a array_one
declare -a array_two
declare -a array_three
declare -a array_four

## Sets a bunch of varibles
total_cve=$(jq '.CVE_data_numberOfCVEs' $1 | sed 's/"//g')
seq_max=$((total_cve-1))
seq_min=0
no_cpu=4
sections=$(($seq_max / $no_cpu))


## Setup for array 1
section_less_one=$(($sections - 1))

## Setup for array 2
sections2_less_one=$(($sections + $section_less_one))

## Setup for array 3
multi_3=$(($sections * 3))
sections3_less_one=$(($multi_3 - 1))
multi_2=$(($sections * 2))


rm /tmp/${output_file}* > /dev/null 2>&1

## Used for testing
rm /tmp/temp_software* > /dev/null 2>&1
test=1
if [ $test = 1 ]; then
    ## Test arrays
    array_one=(0 199)  
    array_two=(200 399)  
    array_three=(300 499)
    array_four=(500 699) 
else
    ## Actual arrays
    array_one=($seq_min $section_less_one)
    array_two=($sections $sections2_less_one)
    array_three=($multi_2 $sections3_less_one)
    array_four=($multi_3 $seq_max)
fi



## Make array 1 files
touch /tmp/${output_file}1a
touch /tmp/${output_file}1b
touch /tmp/${output_file}1c
touch /tmp/${output_file}1d

A1_12=$((${array_one[1]} / 4))

A1_21=$(($A1_12 + 1))
A1_22=$(($A1_12 * 2))

A1_31=$(($A1_22 + 1))
A1_32=$(($A1_12 * 3))

A1_41=$(($A1_32 + 1))

array_oneA=(${array_one[0]} $A1_12)
array_oneB=($A1_21 $A1_22)
array_oneC=($A1_31 $A1_32)
array_oneD=($A1_41 ${array_one[1]})

## Make array 2 files
touch /tmp/${output_file}2a
touch /tmp/${output_file}2b
touch /tmp/${output_file}2c
touch /tmp/${output_file}2d



A2_12=$((${array_two[0]} + $A1_12))

A2_21=$(($A2_12 + 1))
A2_22=$(($A2_21 + $A1_12))

A2_31=$(($A2_22 + 1))
A2_32=$((A2_31  + $A1_12))

A2_41=$(($A2_32 + 1))

array_twoA=(${array_two[0]} $A2_12)
array_twoB=($A2_21 $A2_22)
array_twoC=($A2_31 $A2_32)
array_twoD=($A2_41 ${array_two[1]})

## Make array 3 files
touch /tmp/${output_file}3a
touch /tmp/${output_file}3b
touch /tmp/${output_file}3c
touch /tmp/${output_file}3d


A3_12=$((${array_three[0]} + A1_12))

A3_21=$(($A3_12 + 1))
A3_22=$(($A3_21 + $A1_12))

A3_31=$(($A3_22 + 1))
A3_32=$(($A3_31 + $A1_12))

A3_41=$(($A3_32 + 1))

array_threeA=(${array_three[0]} $A3_12)
array_threeB=($A3_21 $A3_22)
array_threeC=($A3_31 $A3_32)
array_threeD=($A3_41 ${array_three[1]})

## Make array 4 files
touch /tmp/${output_file}4a
touch /tmp/${output_file}4b
touch /tmp/${output_file}4c
touch /tmp/${output_file}4d

A4_12=$((${array_four[0]} + A1_12))

A4_21=$(($A4_12 + 1))

A4_22=$(($A4_21 + $A1_12))

A4_31=$(($A4_22 + 1))
A4_32=$(($A4_31 + $A1_12))

A4_41=$(($A4_32 + 1))

array_fourA=(${array_four[0]} $A4_12)
array_fourB=($A4_21 $A4_22)
array_fourC=($A4_31 $A4_32)
array_fourD=($A4_41 ${array_four[1]})


create_files_req() {
    jq ".CVE_Items[${array_oneA[0]}:${array_oneA[1]}]" "${FILE}" > /tmp/array_file1a.json
    jq ".CVE_Items[${array_oneB[0]}:${array_oneB[1]}]" "${FILE}" > /tmp/array_file1b.json
    jq ".CVE_Items[${array_oneC[0]}:${array_oneC[1]}]" "${FILE}" > /tmp/array_file1c.json
    jq ".CVE_Items[${array_oneD[0]}:${array_oneD[1]}]" "${FILE}" > /tmp/array_file1d.json

    jq ".CVE_Items[${array_twoA[0]}:${array_twoA[1]}]" "${FILE}" > /tmp/array_file2a.json
    jq ".CVE_Items[${array_twoB[0]}:${array_twoD[1]}]" "${FILE}" > /tmp/array_file2b.json
    jq ".CVE_Items[${array_twoC[0]}:${array_twoC[1]}]" "${FILE}" > /tmp/array_file2c.json
    jq ".CVE_Items[${array_twoD[0]}:${array_twoD[1]}]" "${FILE}" > /tmp/array_file2d.json

    jq ".CVE_Items[${array_threeA[0]}:${array_threeA[1]}]" "${FILE}" > /tmp/array_file3a.json
    jq ".CVE_Items[${array_threeB[0]}:${array_threeB[1]}]" "${FILE}" > /tmp/array_file3b.json
    jq ".CVE_Items[${array_threeC[0]}:${array_threeC[1]}]" "${FILE}" > /tmp/array_file3c.json
    jq ".CVE_Items[${array_threeD[0]}:${array_threeD[1]}]" "${FILE}" > /tmp/array_file3d.json

    jq ".CVE_Items[${array_fourA[0]}:${array_fourA[1]}]" "${FILE}" > /tmp/array_file4a.json
    jq ".CVE_Items[${array_fourB[0]}:${array_fourB[1]}]" "${FILE}" > /tmp/array_file4b.json
    jq ".CVE_Items[${array_fourC[0]}:${array_fourC[1]}]" "${FILE}" > /tmp/array_file4c.json
    jq ".CVE_Items[${array_fourD[0]}:${array_fourD[1]}]" "${FILE}" > /tmp/array_file4d.json
}

## Wait for required files to be created
echo
echo
echo -n "Creating required files: "
create_files_req & spinner $!
echo
echo "Done creating files."
echo

max_sequence=$((${array_fourD[1]} - ${array_fourD[0]}))

test_range=0

if [ $test_range = 1 ]; then
    echo 1
    echo ${array_oneA[@]}
    echo ${array_oneB[@]}
    echo ${array_oneC[@]}
    echo ${array_oneD[@]}
    echo $((${array_oneA[1]} - ${array_oneA[0]}))
    echo $((${array_oneB[1]} - ${array_oneB[0]}))
    echo $((${array_oneC[1]} - ${array_oneC[0]}))
    echo $((${array_oneD[1]} - ${array_oneD[0]}))
    echo 2
    echo ${array_twoA[@]}
    echo ${array_twoB[@]}
    echo ${array_twoC[@]}
    echo ${array_twoD[@]}
    echo $((${array_twoA[1]} - ${array_twoA[0]}))
    echo $((${array_twoB[1]} - ${array_twoB[0]}))
    echo $((${array_twoC[1]} - ${array_twoC[0]}))
    echo $((${array_twoD[1]} - ${array_twoD[0]}))
    echo 3
    echo ${array_threeA[@]}
    echo ${array_threeB[@]}
    echo ${array_threeC[@]}
    echo ${array_threeD[@]}
    echo $((${array_threeA[1]} - ${array_threeA[0]}))
    echo $((${array_threeB[1]} - ${array_threeB[0]}))
    echo $((${array_threeC[1]} - ${array_threeC[0]}))
    echo $((${array_threeD[1]} - ${array_threeD[0]}))
    echo 4
    echo ${array_fourA[@]}
    echo ${array_fourB[@]}
    echo ${array_fourC[@]}
    echo ${array_fourD[@]}
    echo $((${array_fourA[1]} - ${array_fourA[0]}))
    echo $((${array_fourB[1]} - ${array_fourB[0]}))
    echo $((${array_fourC[1]} - ${array_fourC[0]}))
    echo $((${array_fourD[1]} - ${array_fourD[0]}))

    exit 0

fi

windows_version=(":windows_xp:" ":windows_vista:" ":windows_7:" ":windows_8:" ":windows_8.1:" ":windows_rt_8:" ":windows_server_2003:" ":windows_server_2008:" ":windows_server_2012:" ":windows_server_2016:")

# $1="array num" $2="array letter"
big_loop () {
    #mapfile -t arr < <(query-json -c '.['"${2}"']'  '/tmp/array_file'"${1}"'.json')
    mapfile -t arr < <(jq '.['"${2}"']'  '/tmp/array_file'"${1}"'.json')
    echo ${arr[@]} | grep -oE ":windows_8.1:|:windows_server_2008:|:windows_rt_8.1:|:windows_server_2012:|:windows_7:|:windows_vista:|:windows_xp:|:windows_server_2003:|:windows_server_2016:" > /tmp/temp_systems$1
    if [ $? -eq 0 ]; then
        
        ## Gets required Data
        echo ${arr[@]} > /tmp/temp_grep$1
        grep -oE ".ID.: .CVE-[[:digit:]]{4}-[[:digit:]]{4,6}." /tmp/temp_grep$1 > /tmp/temp_output$1
        grep -oE ".description.:.{28}.[[:graph:]]{5,14}..}" /tmp/temp_grep$1 >> /tmp/temp_output$1
        grep -oP ".description_data.:.{28}.(.*?)}" /tmp/temp_grep$1 >> /tmp/temp_output$1
        
        ## Finds out what windows versions the CVE affects 
        for system in ${windows_version[@]}; do
            if grep -Fxq "$system" /tmp/temp_systems$1; then
                echo -n "$system, " >> /tmp/temp_output$1
            fi 
        done

        ## Finds out what software is effected
        echo ${arr[@]} | grep -oP ":microsoft:(.*?):(.*?):" >> /tmp/temp_software
        #
        #   sed {REMOVE OS VERSIONS FROM FILE}
        #
        #   mapfile -t software_m /tmp/temp_software
        #   
        #   for software in ${software_m[@]}; do
        #       if [ x != ":windows_8.1:|:windows_server_2008:|:windows_rt_8.1:|:windows_server_2012:|:windows_7:|:windows_vista:|:windows_xp:|:windows_server_2003:|:windows_server_2016:" ]; then
        #           echo "$x, " >> /tmp/temp_output$1 
        #       fi
        #   done

        
        ## Cleans up the data by removing the excess info
        sed -i -e '1s/"ID": "//;1s/"//' /tmp/temp_output$1
        sed -i -e '2s/"description": \[ { "lang": "en", "value": "//;2s/" }//' /tmp/temp_output$1
        sed -i -e '3s/"description_data": \[ { "lang": "en", "value": //;3s/ }//;3s/,/","/g' /tmp/temp_output$1
        sed -i -e '4s/:w/w/g;4s/:,//g' /tmp/temp_output$1 
        tr '\n' '% ' < /tmp/temp_output$1 >> /tmp/$output_file$1
        echo "%" >> /tmp/$output_file$1
        
        
        echo "Thread{$1} ($COUNTER/$max_sequence) ${grn}FOUND${end}"
        let COUNTER++
        
    else 
        
        ## If data required was not found
        echo "Thread{$1} ($COUNTER/$max_sequence) ${red}NOT FOUND${end}"
        let COUNTER++ 
        
    fi
}

## List of windows versions contained in the CVEs
echo
echo
SECONDS=0
COUNTER=0



## Ranges
oneA=$((${array_oneA[1]} - ${array_oneA[0]}))
oneB=$((${array_oneB[1]} - ${array_oneB[0]}))
oneC=$((${array_oneC[1]} - ${array_oneC[0]}))
oneD=$((${array_oneD[1]} - ${array_oneD[0]}))

twoA=$((${array_twoA[1]} - ${array_twoA[0]}))
twoB=$((${array_twoB[1]} - ${array_twoB[0]}))
twoC=$((${array_twoC[1]} - ${array_twoC[0]}))
twoD=$((${array_twoD[1]} - ${array_twoD[0]}))

threeA=$((${array_threeA[1]} - ${array_threeA[0]}))
threeB=$((${array_threeB[1]} - ${array_threeB[0]}))
threeC=$((${array_threeC[1]} - ${array_threeC[0]}))
threeD=$((${array_threeD[1]} - ${array_threeD[0]}))

fourA=$((${array_fourA[1]} - ${array_fourA[0]}))
fourB=$((${array_fourB[1]} - ${array_fourB[0]}))
fourC=$((${array_fourC[1]} - ${array_fourC[0]}))
fourD=$((${array_fourD[1]} - ${array_fourD[0]}))



echo
echo "STARTING ARRAY 1"
echo
sleep 1

while true; do
    for a1 in $(seq 0 $oneA); do
        big_loop "1a" $a1
    done &

    for a2 in $(seq 0 $oneB); do
        big_loop "1b" $a2
    done &

    for a3 in $(seq 0 $oneC); do
        big_loop "1c" $a3
    done &

    for a4 in $(seq 0 $oneD); do
        big_loop "1d" $a4
    done &

    wait
    wait
    break
done

COUNTER=0
echo
echo "ARRAY 1 FINISHED, NOW STARTING ARRAY 2"
echo
sleep 1


while true; do
    for b1 in $(seq 0 $twoA); do
        big_loop "2a" $b1
    done &

    for b2 in $(seq 0 $twoB); do
        big_loop "2b" $b2
    done &

    for b3 in $(seq 0 $twoC); do
        big_loop "2c" $b3
    done &

    for b4 in $(seq 0 $twoD); do
        big_loop "2d" $b4
    done &

    wait
    wait
    break
done

COUNTER=0
echo
echo "ARRAY 2 FINISHED, NOW STARTING ARRAY 3"
echo
sleep 1

while true; do
    for c1 in $(seq 0 $threeA); do
        big_loop "3a" $c1
    done &

    for c2 in $(seq 0 $threeB); do
        big_loop "3b" $c2
    done &

    for c3 in $(seq 0 $threeC); do
        big_loop "3c" $c3
    done &

    for c4 in $(seq 0 $threeD); do
        big_loop "3d" $c4
    done &

    wait
    wait
    break
done

COUNTER=0
echo
echo "ARRAY 3 FINISHED, NOW STARTING ARRAY 4"
echo
sleep 1

while true; do
    for d1 in $(seq 0 $fourA); do
        big_loop "4a" $d1
    done &

    for d2 in $(seq 0 $fourB); do
        big_loop "4b" $d2
    done &

    for d3 in $(seq 0 $fourC); do
        big_loop "4c" $d3
    done &

    for d4 in $(seq 0 $fourD); do
        big_loop "4d" $d4
    done &

    wait
    wait
    break
done

echo "ALL ARRAYS ARE NOW FINSIHED"
sleep 1



## something dodgy
cat /tmp/${output_file}* > $output_file
sed -i -e 's/ %//g' $output_file
rm /tmp/temp_output* > /dev/null 2>&1
rm /tmp/temp_grep* > /dev/null 2>&1
rm /tmp/temp_systems* > /dev/null 2>&1
rm /tmp/array_file* > /dev/null 2>&1
rm /tmp/${output_file}* > /dev/null 2>&1
#rm /tmp/temp_software* > /dev/null 2>&1


echo
echo "
╔════════╗
║Job Done║
╚════════╝
"
echo
duration=$SECONDS
echo "$(($duration / 60)) minutes and $(($duration % 60)) seconds elapsed."
exit 0