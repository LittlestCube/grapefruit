#!/bin/bash

# grfr.sh

if [ "$1" == "split" ]
then
	split -b 4294967294 "$2"
	inc=0
	for i in x??
	do
		mv "$i" "$2".$inc
		inc=$((inc+1))
	done
	echo "I: ISO successfully split!"
elif [ "$1" == "join" ]
then
	inc=0
	while (true)
	do
		fname="$2"."$inc"
		if ls "$2" 2>/dev/null
		then
			of="$2".new
		else
			of="$2"
		fi
		if ls "$fname" 2>/dev/null
		then
			cat "$2"."$inc" >> "$of"
		else
			break
		fi
		inc=$((inc+1))
	done
	echo "I: ISO successfully joined!"
else
	echo "~~~~"
	echo "E: invalid argument or arguments"
	echo "usage: grfr [split OR join] [name of .iso]"
	echo ""
	echo "tip: it might be best to do all this in a new folder"
	echo "~~~~"
fi