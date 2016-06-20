#!/bin/sh
CURRENT_STATE=`amixer get Master | egrep 'Playback.*?\[o' | egrep -o '\[o.+\]'`
echo $CURRENT_STATE

if [ "$1" == "up" ]; then
	amixer -c 0 sset 'Master',0 "$2"dB+
elif [ "$1" == "down" ]; then
	amixer -c 0 sset 'Master',0 "$2"dB-
elif [ "$1" == "mute" ]; then
	echo "muting"
	if [ $CURRENT_STATE == "[on]" ]; then
		amixer set Master mute
	else
		amixer set Master unmute
		amixer set Speaker unmute
		amixer set Headphone unmute
	fi
else
	echo "No command specified";

fi
