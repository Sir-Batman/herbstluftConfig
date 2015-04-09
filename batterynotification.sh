#!/bin/sh
BATC=/sys/class/power_supply/BAT0/capacity
BATS=/sys/class/power_supply/BAT0/status

while :; do

	SIGN=$(test "`cat $BATS`" = "Charging" && echo -n '+' || echo -n '-')
	NUM=`cat $BATC`

	if [ $SIGN = "-" ];
	then
		if [ $(echo "$NUM < 5" | bc) = "1" ];
		then
			notify-send -u critical "Battery Critical" "The computer will now suspend. Please find a powersource.";
			sleep 5;
			./suspend.sh;
		elif [ $(echo "$NUM < 10" | bc) = "1" ];
		then
			notify-send -u critical "Low Battery" "Your battery is low. Please suspend or find a powersource";
		fi
	fi

	sleep 60
done
