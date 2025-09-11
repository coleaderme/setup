#!/usr/bin/sh

sudo pacman -Syy
sudo pacman -S --needed i3-wm i3status-rust thunar xfce4-terminal

# config files
cp -rf config/i3 ~/.config/
cp -rf config/i3status-rs ~/.config/

# xinit entry
cp startx_xyz/xinitrc_i3 ~/.xinitrc
echo "You may reboot now."
