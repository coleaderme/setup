#!/usr/bin/bash
#
# This file should be in HOME directory of USER.
# to avoid permission hassle, re-clone this in '~/' as USER.
#
# Common packages for all environments.
#

echo "========================================================"
echo "run as USER on first login"
echo "========================================================"
# Installs
sudo pacman -Syy
sudo pacman -S --needed xorg-server xorg-xinit ntfs-3g ttf-inconsolata ttf-arphic-ukai ttf-indic-otf ttf-linux-libertine noto-fonts-emoji alsa-utils wireguard-tools openresolv wgcf viewnior xsel scrot aria2 python yt-dlp python-brotli mpv dmenu clipmenu htop p7zip tealdeer ripgrep fd choose broot numlockx
git clone https://aur.archlinux.org/yay-bin.git && cd yay-bin && makepkg -sic
yay -S brave-bin
# yay -S ungoogled-chromium-bin
wget "https://github.com/eza-community/eza/releases/download/v0.11.1/eza_x86_64-unknown-linux-gnu.tar.gz" && tar -xf eza* && sudo mv eza /usr/bin/
# config files / dot files
echo "[+] moving confs to ~/.config"
mv config/psd ~/.config/
mv config/bashrc ~/.bashrc
mv config/mpv ~/.config/
mv config/htop ~/.config/
mv config/angrysearch ~/.config/
mv config/sublime-text ~/.config/
mv config/chromium-flags.conf ~/.config/
mv config/code-flags.conf ~/.config/
mv config/chrome-flags.conf ~/.config/
mv config/autostart ~/.config/
mv config/broot ~/.config/
mkdir ~/Pictures
mv scripts/scr.sh ~/Pictures/

echo "echo performance | sudo tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor" >> ~/.bash_profile
echo "startx" >> ~/.bash_profile
echo ""
echo 'Finished.'
