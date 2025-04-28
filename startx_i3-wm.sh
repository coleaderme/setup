#!/usr/bin/sh

pacman -Syy
pacman -S --needed i3-wm i3status-rust numlockx thunar xfce4-terminal

# config files
cp -rf config/i3 ~/.config/
cp -rf config/i3status-rs ~/.config/

# xinit entry
cp /etc/X11/xinit/xinitrc /etc/X11/xinit/xinitrc.bak && cp startx_xyz/xinitrc_i3 /etc/X11/xinit/xinitrc
echo "You may reboot now."