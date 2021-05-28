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

# load firejail apparmor profile into kernel
# This seems to cause an X error with the latest version of zoom - needs investigating
# sudo apparmor_parser -r /etc/apparmor.d/firejail-default

# prepare X session
xrandr --output HDMI1 --mode 1600x1200 --output HDMI3 --mode 1600x1200 --right-of HDMI1 &
xinput --set-button-map "Kensington Expert Mouse" 3 8 1 4 5 6 7 2 9 &
picom --experimental-backends --config ~/.config/picom/picom.conf &
dwmblocks &
nitrogen --restore &
exec dwm
