#!/usr/bin/sh
#
# This file should be in ~/ << home directory of USER.
# to avoid permission hassle, re-clone this in '~/' as USER.
#
sudo pacman -Syy
sudo pacman -S --needed i3-wm i3status-rust numlockx thunar xfce4-terminal

#config files
mv config/i3 ~/.config/
mv config/i3status-rs ~/.config/

#xinit entry
sudo mv startx_xyz/xinitrc_i3 /etc/X11/xinit/xinitrc
echo "You may reboot now."