#!/usr/bin/env bash 

#Find out your monitor name with xrandr or arandr (save and you get this line)
#xrandr --output VGA-1 --primary --mode 1360x768 --pos 0x0 --rotate normal
#xrandr --output DP2 --primary --mode 1920x1080 --rate 60.00 --output LVDS1 --off &
#xrandr --output LVDS1 --mode 1366x768 --output DP3 --mode 1920x1080 --right-of LVDS1
#xrandr --output HDMI2 --mode 1920x1080 --pos 1920x0 --rotate normal --output HDMI1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output VIRTUAL1 --off
#autorandr horizontal
wmname LG3D &
#change your keyboard if you need it
#setxkbmap -layout be
xmodmap -e "keycode 9 = Caps_Lock"; xmodmap -e "keycode 66 = Escape" &
xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape' &
killall mocicon
mocicon &
nitrogen --restore &
xsetroot -cursor_name left_ptr &
killall sxhkd
sxhkd -c /opt/xelph-dwm-git/sxhkdrc &
nm-applet &
numlockx on &
#blueberry-tray &
killall picom
picom --experimental-backends --config /opt/xelph-dwm-git/picom.conf &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
killall dunst
exec dunst &
xset r rate 350 60 &
betterlockscreen -u $(cat ~/.config/nitrogen/bg-saved.cfg | grep file | sed 's/file=//g') &
/opt/xelph-dwm-git/scripts/bar.sh &
dwm
