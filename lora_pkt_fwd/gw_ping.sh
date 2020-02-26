#!/bin/bash

from time import sleep
#TARGET=$(grep -Po '(?<="server_address": ")[^"\\]*(?:\\.[^"\\]*)*' global_conf.json)
TARGET=$(grep -Po '(?<="server_address": ")[\w\.]+' global_conf.json)
PORT=$(grep -Po '(?<="serv_port_up": )[\d]+' global_conf.json)
flag="true"
echo $TARGET
	while [ 1 -eq 1 ]
	do
#		ping -nc 1 $TARGET > /dev/null
	NMAP=$(nmap -p $PORT $TARGET)
	teste=$(echo "$NMAP" | grep -o "Host is up")
	if [ "$teste" == "Host is up" ]; then
	        echo "Host is up"
		if [ "$flag" == "true" ]; then
			echo "Restart packet-forwarder"
			flag="false"
			service packet-forwarder restart
		fi
	else
	        echo "Host is down"
		flag="true"
#		service packet-forwarder restart
	fi
#	if [ $? -ne 0 ]; then
#		service packet-forwarder restart
#		echo "server is down"
#		echo "restart packet forwarder"
#	fi
	sleep 60
	done
