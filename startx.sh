#!/usr/bin/bash
sudo timedatectl set-ntp true
sudo mv xinitrc /etc/X11/xinit/xinitrc
mkdir ~/Pictures
mv scr.sh ~/Pictures/
mv mpv ~/.config/
mv /omb/* ~/
mv ~/oh-my-bash ~/.oh-my-bash
mv ~/bashrc ~/.bashrc