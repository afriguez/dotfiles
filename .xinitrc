#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then







    xrdb -merge $sysresources

fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then







    xrdb -merge "$userresources"

fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

# monitors
xrandr --output eDP-1 --primary --mode 1366x768 --pos 0x312 --output HDMI-1 --mode 1920x1080 --pos 1366x0

# compositor
picom --no-fading-openclose &

# wallpaper
feh --bg-scale --no-fehbg ~/Downloads/Wallpaper/nice.jpg

# brightness
xrandr --output eDP-1 --brightness 0.7

while true; do
	xsetroot -name "$(date '+%b %d (%a) %H:%M%P') $(cat /sys/class/power_supply/BAT0/capacity)%"
	sleep 30s
done &

exec dwm
