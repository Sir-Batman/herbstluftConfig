#!/bin/sh

if [ "$1" == "inc" ]; then
	xbacklight -inc $2
else
	xbacklight -dec $2
fi

