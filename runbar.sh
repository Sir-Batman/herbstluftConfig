monitor=${1:-0} 

BAR=`ps -A | grep lemonbar`
PANEL=`ps -A | grep panel.sh`

if [[ -n "$BAR" ]]
then
	#echo "kill bar"
	pkill lemonbar

fi

if [[ -n "$PANEL" ]]
then
	#echo "no kill panel"
	pkill panel.sh
fi

FRGAP=$(herbstclient get frame_gap)
FRPAD=$(herbstclient get frame_padding)
WINGAP=$(herbstclient get window_gap)

if [ $FRGAP == 30 ]
then
	#echo "then"
	herbstclient pad $monitor 40
	WIDTH=1166
	HEIGHT=30

	W_OFFSET=100
	H_OFFSET=10 

else
	#echo "else"
	herbstclient pad $monitor 25
	WIDTH=1366
	HEIGHT=25

	W_OFFSET=0
	H_OFFSET=0

fi

#echo $WIDTH
#echo $HEIGHT
#echo $W_OFFSET
#echo $H_OFFSET

~/.config/herbstluftwm/panel.sh | lemonbar -f "DejaVu Sans" -p -B\#ff191919 -g $WIDTH\x$HEIGHT+$W_OFFSET+$H_OFFSET
#~/.config/herbstluftwm/panel.sh | bar  -p -B\#ff191919 -g 1400x30+100+10
#-*-bitstream vera sans-*-r-*-*-*-120-*-*-*-*-*-*
