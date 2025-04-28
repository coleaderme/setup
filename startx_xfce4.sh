#!/usr/bin/sh

pacman -Syy
pacman -S --needed xfce4 gvfs gvfs-mtp

# xinit entry
cp /etc/X11/xinit/xinitrc /etc/X11/xinit/xinitrc.bak && cp startx_xyz/xinitrc_xfce4 /etc/X11/xinit/xinitrc
echo "You may reboot now."