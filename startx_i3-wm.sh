#!/usr/bin/bash
sudo timedatectl set-ntp true
sudo pacman -Syy
sudo pacman -S i3-wm i3status-rs numlockx

#config files
mv i3 ~/.config/
mv i3status-rs ~/.config/
mv mpv ~/.config/
mkdir ~/Pictures

#xinit entry
sudo mv xinitrc_i3 /etc/X11/xinit/xinitrc

# .bashrc
mv bashrc ~/.bashrc
echo "startx" >> ~/.bash_profile
echo "reboot now"