monitor=${1:-0}
herbstclient pad $monitor 30
source ~/.colors

~/.config/herbstluftwm/panel.sh | bar -f "-*-gohufont-medium-*-*--11-*-*-*-*-*-iso10646-1" -p -B\#ff191919 -g 1400x30+100+10
