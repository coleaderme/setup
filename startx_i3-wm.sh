#!/usr/bin/sh
#
# This file should be in ~/ << home directory of USER.
# to avoid permission hassle, re-clone this in '~/' as USER.
#
sudo pacman -Syy
sudo pacman -S --needed i3-wm i3status-rust numlockx thunar xfce4-terminal

#config files
cp -rf config/i3 ~/.config/
cp -rf config/i3status-rs ~/.config/

#xinit entry
sudo cp startx_xyz/xinitrc_i3 /etc/X11/xinit/xinitrc
echo "You may reboot now."