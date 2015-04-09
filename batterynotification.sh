#!/bin/sh
while :; do

    BATC=/sys/class/power_supply/BAT0/capacity
	NUM=`cat $BATC`
	echo "num: $NUM"
	echo $(echo "$NUM < 5" | bc)

	if [ $(echo "$NUM < 5" | bc) = "1" ];
	then
		notify-send -u critical "Battery Critical" "The computer will now suspend. Please find a powersource.";
		sleep 5;
		./suspend.sh;
	elif [ $(echo "$NUM < 10" | bc) = "1" ];
	then
		notify-send -u critical "Low Battery" "Your battery is low. Please suspend or find a powersource";
	fi

	sleep 60
done
