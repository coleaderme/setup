#!/usr/bin/sh

pacman -Syy
pacman -S --needed xfce4

# xinit entry
cp startx_xyz/xinitrc_xfce4 /etc/X11/xinit/xinitrc
echo "You may reboot now."