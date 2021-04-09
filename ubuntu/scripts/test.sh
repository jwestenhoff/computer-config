#!/bin/bash

internet=true
isLaptop=false
dualBoot=false

for arg in "$@"; do
	echo arg $arg
	case "$arg" in
	nointernet) internet=false ;;
	laptop) isLaptop=true ;;
	-?) echo "No $arg argument found.";;
	esac
done

echo internet $internet
echo isLaptop $isLaptop

echo -------------------------------------

echo hello

message="This is a message!"
echo "$message"

unset message

echo "$message"

date +%A # current date in pc language

LC_ALL=C date +%A # current date in english

# Begrüßung
#read -p "Geben sie ihren Namen ein:" name
echo Hallo: $name

if [ false ]; then
	echo this is the if!
fi

while getopts u:d:p:f:internet: option; do
	case "${option}" in
	u) USER=${OPTARG} ;;
	d) DATE=${OPTARG} ;;
	p) PRODUCT=${OPTARG} ;;
	f) FORMAT=${OPTARG} ;;
	internet) INTERNET=true ;;
	esac
done

echo "$INTERNET"
echo "$USER"
