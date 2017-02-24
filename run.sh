#!/usr/bin/env bash
ISO="/home/pi/tails-i386-2.10.iso"
DISK="/dev/sda"
size=$(stat $ISO --format=%s)
if [ -a "$DISK" ]; then
	umount $DISK*
	pkill python
	pkill dd
	killall dd
	/home/pi/utils/starting.py
	/home/pi/utils/loading.py &
	echo "0" > .inbetween
	(dd if=$ISO of=$DISK bs=32M status=progress 2>> .inbetween) &
	progress=0
	while (( "$progress" < "100" )); do
		value=$(cat .inbetween | sed -e "s/\r/\n/g" | tail -n 1 | cut -d " " -f 1)
		if [[ $value == " " ]]; then
			break;
		else
			fprogress=$(echo "($value / $size)*100" | bc -l )
			progress=${fprogress%.*}
			echo $progress
			echo $progress > /home/pi/.log
		fi
		sleep 4
	done 
	echo "-1" > /home/pi/.log 
	pkill python
	rm /home/pi/.log .inbetween
fi
