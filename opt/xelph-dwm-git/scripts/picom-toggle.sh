#!/usr/bin/env bash
if pgrep -x "picom" > /dev/null
then
	killall picom
else
	picom -b --config /opt/xelph-dwm-git/picom.conf
fi
