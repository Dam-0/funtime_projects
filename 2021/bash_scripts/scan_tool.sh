#!/bin/bash

ip="$1"

error_check() {
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

host_scan() {
#pings host
fping -c1 -t300 $ip 2>/dev/null 1>/dev/null

#Checks if the Host is up
	if [ "$?" = 0 ]; then
		nmap -sV "$ip" | grep -E "([0-9]{1,5})\/(tcp|udp)" > /tmp/services
		return 0
	else
		echo "Failed to find host"
		exit 1
	fi
}

#Checks services against search sploit
search_sploit(){

	#Checks if services are found
	echo $(wc -l /tmp/services | grep -o ^[1-9]) | read service_total
	if [ "$service_total" == 0 ]; then
		echo "No Services found on host"
		$service_total
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

	echo "==============================" > exploits.txt
	echo "== Possible Vulnerabilities ==" >> exploits.txt
	echo "==============================" >> exploits.txt

	while IFS='' read LINE || [[ -n "${LINE}" ]]; do
   		searchsploit ${LINE} | sed -e '1,2d' | head -n -2 >> exploits.txt
   		echo "==" >> exploits.txt
	done < /tmp/output

}

#Adds loading animation
spinner()
{
    local pid=$!
    local delay=0.75
    local spinstr='|/-\'
    while [ "$(ps a | awk '{print $1}' | grep $pid)" ]; do
        local temp=${spinstr#?}
        printf " [%c]  " "$spinstr"
        local spinstr=$temp${spinstr%"$temp"}
        sleep $delay
        printf "\b\b\b\b\b\b"
    done
    printf "    \b\b\b\b"
}


error_check
host_scan &
spinner
search_sploit &
spinner


cat exploits.txt

echo ""
echo "Check <exploits.txt> for results"
exit 0