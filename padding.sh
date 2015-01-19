#!/bin/sh
FRGAP=$(herbstclient get frame_gap)
FRPAD=$(herbstclient get frame_padding)
WINGAP=$(herbstclient get window_gap)

if [ $FRGAP == 30 ]
then
	herbstclient set frame_gap 5
else
	herbstclient set frame_gap 30
fi

if [ $FRPAD == 10 ]
then
	herbstclient set frame_padding 0
else
	herbstclient set frame_padding 10
fi

if [ $WINGAP == 10 ]
then
	herbstclient set window_gap 0
else
	herbstclient set window_gap 10
fi

