#!/bin/sh
#
# z3bra - (c) wtfpl 2014
# Fetch infos on your computer, and print them to stdout every second.
source ~/.colors
BACK=$(echo ${COLOR10} | tr -d '#')
FORE=$(echo ${COLOR15} | tr -d '#')
BACKTEXT=%{F#ff${BACK}}
FORETEXT=%{F#ff${FORE}}

clock() {
	DAY=$(date +%a)
	TIME=$(date '+%H:%M')
	YEAR=$(date +%F)
    echo "$BACKTEXT $DAY $FORETEXT $TIME $BACKTEXT $YEAR"
}

battery() {
    BATC=/sys/class/power_supply/BAT0/capacity
    BATS=/sys/class/power_supply/BAT0/status

    test "`cat $BATS`" = "Charging" && echo -n '+' || echo -n '-'

    sed -n p $BATC
}

volume() {
    #amixer get Master | sed -n 'N;s/^.*\[\([0-9]\+%\).*$/\1/p'
	amixer get Master | grep -oP '\d+(?=%)'
}

cpuload() {
    LINE=`ps -eo pcpu |grep -vE '^\s*(0.0|%CPU)' |sed -n '1h;$!H;$g;s/\n/ +/gp'`
    bc <<< $LINE
}

memused() {
    read t f <<< `grep -E 'Mem(Total|Available)' /proc/meminfo |awk '{print $2}'`
    bc <<< "scale=2; 100 - $f / $t * 100" | cut -d. -f1
}

network() {
    read lo int1 int2 <<< `ip link | sed -n 's/^[0-9]: \(.*\):.*$/\1/p'`
    if iwconfig $int1 >/dev/null 2>&1; then
        wifi=$int1
        eth0=$int2
    else
        wifi=$int2
        eth0=$int1
    fi
    ip link show $eth0 | grep 'state UP' >/dev/null && int=$eth0 ||int=$wifi

    #int=eth0

    ping -c 1 8.8.8.8 >/dev/null 2>&1 && 
        echo "$int connected" || echo "$int disconnected"
}

groups() {
    cur=`xprop -root _NET_CURRENT_DESKTOP | awk '{print $3}'`
    tot=`xprop -root _NET_NUMBER_OF_DESKTOPS | awk '{print $3}'`

#    for w in `seq 1 $((cur))`; do line="${line} $w"; done
#    line="${line} |"
#    for w in `seq $((cur + 1)) $tot`; do line="${line} $w"; done
#	 end=`expr $tot - 1`
	for w in `seq 1 $tot`; do
		if [ `expr $w - 1`  == $cur ]
		then
			line="${line} $FORETEXT $w";
		else
			line="${line} $BACKTEXT $w"
		fi
	done
    echo $line
}

#~ nowplaying() {
    #~ cur=`mpc current`
    #~ # this line allow to choose whether the output will scroll or not
    #~ test "$1" = "scroll" && PARSER='skroll -n20 -d0.5 -r' || PARSER='cat'
    #~ test -n "$cur" && $PARSER <<< $cur || echo "- stopped -"
#~ }

# This loop will fill a buffer with our infos, and output it to stdout.
while :; do
    buf="%{l}"
    buf="${buf} $FORETEXT $(groups) "
    buf="${buf} %{c} $FORETEXT $(clock) "
    buf="${buf} %{r} $BACKTEXT NET: $FORETEXT $(network) "
    buf="${buf} $BACKTEXT CPU: $FORETEXT $(cpuload)%% "
    buf="${buf} $BACKTEXT RAM: $FORETEXT $(memused)%% "
    buf="${buf} $BACKTEXT VOL: $FORETEXT $(volume)%% "
    buf="${buf} $BACKTEXT BAT: $FORETEXT $(battery)%%"
    #buf="${buf} %{F#4c4c4c} MPD: %{F#ffffff} $(nowplaying)"

    echo "  $buf  "
  
    sleep .5 # The HUD will be updated every second
done
