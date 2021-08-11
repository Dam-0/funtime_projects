#!/bin/bash

ip="$1"

# a list of all required packages for script to work
commands_used=("fping" "nmap" "grep" "searchsploit" "awk")

# function that checks for required packages
function pre_run_test(){

	for package in ${!commands_used[@]};
	do
		if  ! command -v ${commands_used[$package]} > /dev/null 2>&1; then
			echo "${commands_used[$package]} not found"
			local missing="1"
		fi
	done

	# exits script if missing packages where found
	[ ! $missing = 0 ] && echo "Please install missing packages" && exit 1
}

function error_check() {
	# checks if user input argument
	if [ -z "$ip" ]; then
		echo "Usage: scan_tool <ip>"
		exit 1

	# checks if user input vaild IP Address
	elif [[ "$ip" =~ ^(([1-9]?[0-9]|1[0-9][0-9]|2([0-4][0-9]|5[0-5]))\.){3}([1-9]?[0-9]|1[0-9][0-9]|2([0-4][0-9]|5[0-5]))$ ]]; then
		return 0
	else
 		echo "Input Valid IPv4 Address"
 	 	exit 1
	fi
}

function host_scan() {
# pings host
fping -c1 -t300 $ip > /dev/null 2>&1

# checks if the Host is up
	if [ "$?" = 0 ]; then

		# gets the services and versions
		nmap -sV "$ip" | grep -E "([0-9]{1,5})\/(tcp|udp)" > /tmp/services
		return 0
	else
		echo "Failed to find host"
		exit 1
	fi
}

# checks services against search sploit
function search_sploit(){

	# checks if services are found
	if [[ -z $(grep '[^[:space:]]' /tmp/services) ]]; then
	
		echo "No Services found on host"
		exit 1
	fi

	# checks json is correct format
	grep -q -E "([0-9]{1,5})\/(tcp|udp)" /tmp/services
	if [[ $? != 0 ]]; then
		echo "Error has occured in parsing the JSON file"
		exit 1
	fi

	# checks if directory does not exist then creats it
	[ ! -d ./results ] && mkdir results

	# gets service names and services from results and stores them elsewhere
	awk '{print $4" "$5}' < /tmp/services > /tmp/output

	# checks if files already exists and overwrites it to be blank
	if [ -f ./results/$ip.json ]; then
		rm results/$ip.json
		touch results/$ip.json

	else
		touch results/$ip.json
	fi
	
	while IFS='' read line; do
   		searchsploit ${line} --json >> results/$ip.json
	done < /tmp/output

	# runs files through json function
	prettyjson ./results/$ip.json 

}

# formats json files to be easier to read
prettyjson() {
    python -m json.tool "$1" > /dev/null 2>&1
}



# calls the functions
pre_run_test
error_check
host_scan
search_sploit


echo ""
echo "See the result folder for the relevant scan results"
exit 0