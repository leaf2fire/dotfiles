#!/bin/sh

sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap
userresources=$HOME/.Xresources
# usermodmap=$HOME/.Xmodmap

[[ -f "$sysresources" ]] && xrdb -merge "$sysresources"
[[ -f "$sysmodmap" ]] && xmodmap "$sysmodmap"
[[ -f "$userresources" ]] && xrdb -merge "$userresources"
# [[ -f "$usermodmap" ]] && xmodmap "$usermodmap"

# Run default scripts
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

# Start window manager
exec xmonad
