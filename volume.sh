#!/bin/sh
get_volume(){
	pactl list sinks | grep Volume | awk 'NR==1 {print $5}'
}

is_mute(){
	pactl list sinks | grep Mute | awk 'NR==1 {print $2}'
}

case $1 in
	"up")
		pactl set-sink-volume @DEFAULT_SINK@ +5%
	;;
	"down")
		pactl set-sink-volume @DEFAULT_SINK@ -10%
	;;
	"mute")
		pactl set-sink-mute @DEFAULT_SINK@ toggle
	;;
	*)
		echo "Ninguno seleccionado"
	;;
esac &&

if [ $(is_mute) = "no" ];
then
	notify-send -a cignore -u low -t 1000 "Volumen:" "$(get_volume)"
else
	notify-send -a cignore -u low -t 1000 "Volumen:" "Silenciado"
fi
