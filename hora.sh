#!/bin/sh
pid=$(pgrep Xsession)
while kill -0 $pid 2> /dev/null; 
do
   	xsetroot -name "$( date +"%F %R" )"
   	sleep 20s   # Update time every minute
done &
