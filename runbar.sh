#!/bin/bash
# monitor=${1:-0} 
# 
# BAR=`ps -A | grep lemonbar`
# PANEL=`ps -A | grep panel.sh`
# 
# if [[ -n "$BAR" ]]
# then
# 	#echo "kill bar"
# 	pkill 
# 
# fi
# 
# if [[ -n "$PANEL" ]]
# then
# 	#echo "no kill panel"
# 	pkill panel.sh
# fi
# 
# FRGAP=$(herbstclient get frame_gap)
# FRPAD=$(herbstclient get frame_padding)
# WINGAP=$(herbstclient get window_gap)
# 
# if [ $FRGAP == 30 ]
# then
# 	#echo "then"
# 	herbstclient pad $monitor 40
# 	WIDTH=1166
# 	HEIGHT=30
# 
# 	W_OFFSET=100
# 	H_OFFSET=10 
# 
# else
# 	#echo "else"
# 	herbstclient pad $monitor 25
# 	WIDTH=1366
# 	HEIGHT=25
# 	W_OFFSET=0
# 	H_OFFSET=0
# 
# fi

#echo $WIDTH
#echo $HEIGHT
#echo $W_OFFSET
#echo $H_OFFSET

herbstclient pad 0 30
herbstclient pad 1 50
herbstclient pad 2 50

if [[ $(ps -A | grep polybar) ]] 
then 
    pkill polybar
fi

polybar middlebar &
polybar leftbar &
polybar rightbar &

