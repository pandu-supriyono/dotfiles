#!/bin/sh

[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources
[ -f /etc/xprofile ] && . /etc/xprofile
[ -f ~/.xprofile ] && . ~/.xprofile &
while true; do
	/usr/local/bin/slstatus 2> /dev/null &
	dunst > /dev/null 2>&1 &
	/usr/local/bin/dwm 2> /dev/null 
done 
