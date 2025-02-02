#!/usr/bin/env bash

IP=$1

cd ~/Utils/gonmap

if [[ $IP =~ ^(([0-9]{1,3})\.){1,3}([0-9]{1,3})\/([0-9]+) ]];then
	echo "Input is IP"
	./gonmap -m scanner -p 21,22,23,80,101,110,443,444,139,145,445,554,3702,5000,5060,5061,8000,8080,8091,8291,8290,8728,8729,8899,8999,9000,8670,10000,34567,34599,37777,37778 -u $IP -cp -t 256 -r 1
fi

if [ -e "$IP" ]; then
	echo "input is file"
	while read LINE;do
		./gonmap -m scanner -p 21,22,23,80,443,2000,8080,8091,8291,8290,8728,8729,8899,8999 -u $LINE -cp -t 256 -r 1
	done <$IP
fi
