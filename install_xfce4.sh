#!/usr/bin/bash
sudo pacman -Syy
sudo pacman -S xorg xorg-server xfce4 ntfs-3g noto-fonts noto-fonts-emoji alsa-utils xfce4-clipman-plugin wireguard-tools geany viewnior mpv htop p7zip xarchiver profile-sync-daemon
git clone https://aur.archlinux.org/yay-bin.git && cd yay-bin && makepkg -sic
