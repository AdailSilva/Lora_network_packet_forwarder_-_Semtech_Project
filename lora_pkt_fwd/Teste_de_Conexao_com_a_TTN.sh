#! /bin/bash

#if nc -w5 -z router.au.thethings.network 1700; then
#  echo "Port is listening"
#else
#  echo "Port is not listening"
#fi

NMAP=$(nmap -p 1700 router.au.thethings.network)
#echo ($NMAP | grep "Host is up") &>/dev/null && echo "Host is up" || echo "Host is down"
teste=$(echo "$NMAP" | grep -o "Host is up")
#echo $teste
if [ "$teste" == "Host is up" ]; then
	echo "Host is up"
else
	echo "Host is down"
fi

