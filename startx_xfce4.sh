#!/usr/bin/sh

pacman -Syy
pacman -S --needed xfce4 gvfs gvfs-mtp

# xinit entry
cp startx_xyz/xinitrc_xfce4 ~/.xinitrc
echo "You may reboot now."
