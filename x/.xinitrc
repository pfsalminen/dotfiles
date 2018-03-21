#!/bin/sh
#
# ~/.xinitrc
# Executed by startx 
# By calling this with arguments we can start different sessions
# eg. startx ~/.xinitrc i3  or  startx ~/.xinitrc bspwm
# simply using startx, openbox is set as the default

session=${1:-i3}
export WM="$session"
export XDG_CONFIG_HOME="$HOME/.config"
export PATH=/home/paul/bin:/usr/sbin:$PATH

if [ -f /etc/X11/xinit/.Xmodmap ]; then
    xmodmap /etc/X11/xinit/.Xmodmap
fi

# source files in /etc/X11/xinit/xinitrc.d
if [ -d /etc/X11/xinit/xinitrc.d ]; then
    for f in /etc/X11/xinit/xinitrc.d/*; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi

if [ -f ~/.Xresources ]; then
    xrdb -load ~/.Xresources
fi

if [ -f ~/.Xmodmap ]; then
    xmodmap ~/.Xmodmap
fi

if [ -f ~/.xprofile ]; then
    ~/.xprofile
fi

gnome-keyring-daemon --start --components=pkcs11 &
lxpolkit &
kbdrate -d 400 -r 50
xset r rate 400 50
xset s 3600 3600


[[ -x /usr/bin/dunst ]] && /usr/bin/dunst -config ~/.dunstrc &

if [ -x /usr/bin/gcalcli ]; then
  while true; do
    /usr/bin/gcalcli --calendar="paul.salminen" remind
    sleep 300
  done &
fi

# start the session
case $session in
    i3|i3wm) 
        exec i3
        ;;
    bsp|bspwm)
        exec bspwm
        ;;
    awesome)
        exec awesome
        ;;
    xfce|xfce4) 
        exec startxfce4
        ;;
    openbox|openbox-session) 
        exec openbox-session
        ;;
    *) 
        exec $1
        ;;
esac
