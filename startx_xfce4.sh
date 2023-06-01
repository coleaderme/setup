#!/usr/bin/bash
#
# This file should be in ~/ << home directory of USER.
# to avoid permission hassle, re-clone this in '~/' as USER.
#
sudo pacman -Syy
sudo pacman -S xfce4
#xinit entry
sudo mv xinitrc_xfce4 /etc/X11/xinit/xinitrc
echo "You may reboot now."