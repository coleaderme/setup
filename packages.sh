#!/usr/bin/bash
#
# This file should be in HOME directory of USER.
# to avoid permission hassle, re-clone this in '~/' as USER.
#
echo "========================================================"
echo "run as USER on first login"
echo "========================================================"
# Installs
sudo pacman -Syy
sudo pacman -S --needed xorg-server xorg-xinit ntfs-3g noto-fonts noto-fonts-emoji alsa-utils wireguard-tools openresolv wgcf viewnior scrot aria2 yt-dlp python python-brotli mpv clipmenu htop p7zip tealdeer ripgrep exa numlockx
git clone https://aur.archlinux.org/yay-bin.git && cd yay-bin && makepkg -sic
yay -S ungoogled-chromium-bin
# config files / dot files
mv psd ~/.config/
mv bashrc ~/.bashrc
mv mpv ~/.config/
mv htop ~/.config/
mv angrysearch ~/.config/
mv sublime-text ~/.config/
mv chromium-flags.conf ~/.config/
mv code-flags.conf ~/.config/
mv chrome-flags.conf ~/.config/
mkdir ~/Pictures

echo "echo performance | sudo tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor" >> ~/.bash_profile
echo "startx" >> ~/.bash_profile
echo ""
echo 'Finished.'
