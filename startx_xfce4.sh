#!/usr/bin/sh
#
# This file should be in ~/ << home directory of USER.
# to avoid permission hassle, re-clone this in '~/' as USER.
#
sudo pacman -Syy
sudo pacman -S --needed xfce4

#xinit entry
sudo cp startx_xyz/xinitrc_xfce4 /etc/X11/xinit/xinitrc
echo "You may reboot now."