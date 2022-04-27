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
picom &

# wallpaper
feh --bg-scale --no-fehbg ~/Downloads/Wallpaper/kindred\ 2.jpg

# brightness
xrandr --output eDP-1 --brightness 0.7

clock() {
  printf "^c#21222C^ ^b#8BE9FD^  "
  printf "^c#21222C^^b#A4FFFF^ $(date '+%H:%M')  "
}

battery() {
  capacity="$(cat /sys/class/power_supply/BAT0/capacity)"
  printf "^c#21222C^^b#F1FA8C^  "
  printf "^c#21222C^^b#FFFFA5^ $capacity"
}

wlan() {
  case "$(cat /sys/class/net/wl*/operstate 2>/dev/null)" in
	up) printf "^c#21222C^ ^b#50FA7B^ 直 ^d^%s" "^c#21222C^^b#69ff94^ Connected" ;;
	down) printf "^c#21222C^ ^b#FF5555^ 睊 ^d^%s" "^c#21222C^^b#ff6e6e^ Disconnected" ;;
  esac
}

while true; do
  xsetroot -name "$(battery) $(wlan) $(clock) "
  sleep 30s
done &

exec dwm
