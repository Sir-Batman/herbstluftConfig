#!/bin/bash

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

