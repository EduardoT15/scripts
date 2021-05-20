#!/bin/sh
temp="$(mktemp -u).png"

if maim -f png -s $temp;
then

	if pgrep -fi copyq;
	then
		copyq copy image/png - < $temp  
	else
		xclip -selection clipboard -t image/png < $temp 
	fi && 
	
	notify-send -a cignore -u low -t 2000 "Information" "Image copied to clipboard"

else
	notify-send -a cignore -u low -t 2000 "Information" "Cancelled"
fi

rm -f $temp
