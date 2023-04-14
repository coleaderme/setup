#!/usr/bin/bash
sudo pacman -Syy
sudo pacman -S xorg xorg-server xfce4 ntfs-3g noto-fonts noto-fonts-emoji alsa-utils xfce4-clipman-plugin wireguard-tools openresolv geany viewnior aria2 yt-dlp python-brotli python-pip mpv htop p7zip xarchiver tealdeer
git clone https://aur.archlinux.org/yay-bin.git && cd yay-bin && makepkg -sic
bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"
echo "will it ask for password now?"