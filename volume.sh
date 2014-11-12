#!/bin/sh

if [ "$1" == "up" ]; then
	amixer -c 0 sset 'Master',0 "$2"dB+
else
	amixer -c 0 sset 'Master',0 "$2"dB-
fi
