#!/bin/bash
ports=(80 443)
for (( i = 1; i <= $#; i++ )); do
for port in "${ports[@]}"
do
	if timeout 1 bash -c '</dev/tcp/'$(printf "%s\n" "${!i}")'/'$port' &>/dev/null'
	then
	echo "IP "${!i}":"$port" is open"
	fi
done
done


