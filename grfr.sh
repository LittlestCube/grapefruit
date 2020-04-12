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
	touch "$2"
	inc=0
	while (true)
	do
		fname="$2"."$inc"
		if ls "$fname" 2>/dev/null
		then
			cat "$2"."$inc" >> "$2"
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