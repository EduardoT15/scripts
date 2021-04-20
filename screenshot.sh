#!/bin/sh
temp="$(mktemp -u).png"

if maim -f png -s $temp;
then 
	copyq copy image/png - < $temp && 
	notify-send "Informacion" "Imagen copiada al portapapeles"
else
	notify-send "Informacion" "Cancelado"
fi

rm -f $temp
