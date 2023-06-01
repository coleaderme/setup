#!/usr/bin/bash
#
# This file should be in ~/ << home directory of USER.
# to avoid permission hassle, re-clone this in '~/' as USER.
#
sudo pacman -Syy
sudo pacman -S i3-wm i3status-rust numlockx thunar xfce4-terminal

#config files
mv i3 ~/.config/
mv i3status-rs ~/.config/

#xinit entry
sudo mv xinitrc_i3 /etc/X11/xinit/xinitrc
echo "You may reboot now."