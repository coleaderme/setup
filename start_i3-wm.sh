#!/usr/bin/bash
sudo timedatectl set-ntp true
sudo pacman -Syy
sudo pacman -S i3-wm

#config file
mv i3 ~/.config/

#xinit entry
sudo mv xinitrc_i3 /etc/X11/xinit/xinitrc
mkdir ~/Pictures
mv scr.sh ~/Pictures/
mv mpv ~/.config/
mv /omb/* ~/
mv ~/oh-my-bash ~/.oh-my-bash
mv ~/bashrc ~/.bashrc
