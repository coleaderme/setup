#!/usr/bin/bash
sudo pacman -Syy
sudo pacman -S xorg xorg-server ntfs-3g noto-fonts noto-fonts-emoji alsa-utils wireguard-tools openresolv wgcf geany viewnior aria2 yt-dlp python-brotli python-pip mpv htop p7zip xarchiver tealdeer
git clone https://aur.archlinux.org/yay-bin.git && cd yay-bin && makepkg -sic
echo "include /usr/share/nano/sh.nanorc" > ~/.nanorc
echo "echo performance | sudo tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor" >> ~/.bash_profile
