#!/bin/bash

ip="$1"

function error_check() {
	#Checks if user input argument
	if [ -z "$ip" ]; then
		echo "Usage: scan_tool <ip>"
		exit 1

	#Checks if user input vaild IP Address
	elif [[ "$ip" =~ ^(([1-9]?[0-9]|1[0-9][0-9]|2([0-4][0-9]|5[0-5]))\.){3}([1-9]?[0-9]|1[0-9][0-9]|2([0-4][0-9]|5[0-5]))$ ]]; then
		return 0
	else
 		echo "Input Valid IPv4 Address"
 	 	exit 1
	fi
}

function host_scan() {
#pings host
fping -c1 -t300 $ip 2>/dev/null 1>/dev/null

#Checks if the Host is up
	if [ "$?" = 0 ]; then
		# if host is up scan services
		nmap -sV "$ip" | grep -E "([0-9]{1,5})\/(tcp|udp)" > /tmp/services
		return 0
	else
		echo "Failed to find host"
		exit 1
	fi
}

#Checks services against search sploit
function search_sploit(){

	#Checks if services are found
	if [[ -z $(grep '[^[:space:]]' /tmp/services) ]]; then
	
		echo "No Services found on host"
		exit 1
	fi

	#checks json is correct format
	grep -q -E "([0-9]{1,5})\/(tcp|udp)" /tmp/services
	if [[ $? != 0 ]]; then
		echo "Error has occured in parsing the JSON file"
		exit 1
	fi

	#Gets the services and versions

	awk '{print $4" "$5}' < /tmp/services > /tmp/output

	echo "==============================" > vulnerabilities.txt
	echo "== Possible Vulnerabilities ==" >> vulnerabilities.txt
	echo "==============================" >> vulnerabilities.txt

	while IFS='' read line; do
   		searchsploit ${line} | sed -e '1,2d' | head -n -1 >> vulnerabilities.txt
   		#echo "==" >> vulnerabilities.txt
	done < /tmp/output

}

# Calls the functions
error_check
host_scan
search_sploit


cat vulnerabilities.txt

echo ""
echo "Check <vulnerabilities.txt> for results"
exit 0