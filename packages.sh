#!/usr/bin/sh
#
# This file should be in HOME directory of USER.
# to avoid permission hassle, re-clone this in '~/' as USER.
#
# Common Programs.
#

echo "========================================================"
echo "run as USER on first login"
echo "========================================================"
# Installs
sudo pacman -Syy
sudo pacman -S --needed xorg-server xorg-xinit ntfs-3g \
ttf-inconsolata noto-fonts noto-fonts-emoji \
alsa-utils wireguard-tools openresolv wgcf viewnior xsel scrot \
aria2 python yt-dlp python-brotli mpv dmenu clipmenu htop p7zip \
tealdeer ripgrep fd choose lf numlockx earlyoom thunar
## required for android devices: android-tools gvfs gvfs-mtp
git clone https://aur.archlinux.org/yay-bin.git && cd yay-bin && makepkg -sic
## yay -S ungoogled-chromium-bin
wget "https://github.com/eza-community/eza/releases/download/v0.11.1/eza_x86_64-unknown-linux-gnu.tar.gz" && tar -xf eza* && sudo mv eza /usr/bin/
# config files / dotfiles
echo "[+] moving confs to ~/.config"
mv config/psd ~/.config/
mv config/bashrc ~/.bashrc
mv config/mpv ~/.config/
mv config/htop ~/.config/
mv config/angrysearch ~/.config/
mv config/sublime-text ~/.config/
mv config/chromium-flags.conf ~/.config/
mv config/thorium-flags.conf ~/.config/
mv config/code-flags.conf ~/.config/
mv config/chrome-flags.conf ~/.config/
mv config/autostart ~/.config/
mv config/broot ~/.config/
mv config/fd ~/.config/
mv config/lf ~/.config/
mkdir ~/Pictures
mv scripts/scr.sh ~/Pictures/
mv scripts ~/

echo "echo performance | sudo tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor" >> ~/.bash_profile
echo 'Finished.'

echo "######################################"
echo "[Choose your desktop]:"
echo "startx_dwm.sh    [ultrafast, extreme lightweight, tiling]"
echo "startx_i3-wm.sh  [fast, lightweight, tiling]"
echo "startx_xfce4.sh  [normal, desktop, windows]"
echo "######################################"