#!/bin/bash
if [[ "$1" != "clean" ]]
then
	if [[ "$1" != "sim" ]]
	then
		gpasm -p p12f508 template.s
	else
		gpsim -p p12f508 template.hex
	fi
else
	rm -f *.cod *.hex *.lst
fi
