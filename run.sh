#!/usr/bin/env bash
ISO="/home/pi/tails-i386-2.7.1.iso"
DISK="/dev/sda"
size=$(stat $ISO --format=%s)
if [ -a "$DISK" ]; then
	umount $DISK*
	pkill python
	pkill dd
	killall dd
	~pi/utils/animations.py
	~pi/utils/loading.py &
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
			echo $progress > .log
		fi
		sleep 4
	done 
	echo "-1" > .log
	pkill python
	rm .log .inbetween
fi
