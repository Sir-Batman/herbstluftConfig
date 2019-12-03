#!/bin/bash

change_audio()
{
    pacmd set-default-sink $1
    pacmd list-sink-inputs | grep index | while read line
    do
    echo "Moving input: ";
    echo $line | cut -f2 -d' ';
    echo "to sink: $1";
    pacmd move-sink-input `echo $line | cut -f2 -d' '` $1
    done

}

if [[ $(xrandr | awk '/\ connected/ && /[[:digit:]]x[[:digit:]].*+/{print $1}') =~ 'HDMI-0' ]]
then
    echo "connected! Disconnecting"
    ~/.screenlayout/default.sh
    sleep 1
    change_audio "alsa_output.pci-0000_28_00.3.analog-stereo"
    # Restart middle status bar, since it dies while in TV mode
    ~/.config/herbstluftwm/runbar.sh
else
    echo "disconnected! Connecting"
    ~/.screenlayout/tv.sh
    sleep 1
    change_audio "alsa_output.pci-0000_26_00.1.hdmi-surround-extra1"
fi

