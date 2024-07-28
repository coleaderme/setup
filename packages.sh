#!/usr/bin/sh
# Script [2/3]
# sudo sh packages.sh [ROOT]
#
# This file should be in HOME directory of USER.
# To get permission for setup files do;
# sudo chown -R $USER setup/'
#
echo "========================================================"
echo "[!] run as USER on first login"
echo "========================================================"

# Installs (via pacman)
sudo pacman -Syy
sudo pacman -S --needed --noconfirm xorg-server xorg-xinit xorg-xset ntfs-3g \
ttf-inconsolata ttf-arphic-ukai ttf-carlito noto-fonts ttf-noto-emoji-monochrome \
alsa-utils wireguard-tools openresolv wgcf viewnior xsel scrot \
aria2 mpv dmenu clipmenu htop p7zip \
ripgrep fd sd fzf skim choose numlockx \
earlyoom thunar eza micro nnn feh
## ttyper: Terminal-based typing test
## joshuto-bin (via yay) user friendly! TUI file explorer.
## micro: supports ctrl+d to duplicate line, ctrl+q quit, ctrl+c, ctrl+v auto complete()""''
## jq jless (for json), uv for python-pip and venv alternative
## fend (calc) [from yay/github]
## herbe (minimal popup notification) [from github]
## code-oss (vscode opensource build) with exts -> ruff + python + cody (free ver)
## android-tools gvfs gvfs-mtp (android device support)
## woeusb: create windows usb
## usbimager: create linux usb

git clone https://aur.archlinux.org/yay-bin.git && cd yay-bin && makepkg -sic
# Installs (via yay)
# yay -S joshuto-bin

# config files / dotfiles
echo "[+] copying confs to ~/.config"
mkdir ~/.config
cp config/*.conf ~/.config/
cp -rf config/psd ~/.config/
cp -rf config/bashrc ~/.bashrc
cp -rf config/nanorc ~/.nanorc
cp -rf config/mpv ~/.config/
cp -rf config/htop ~/.config/
cp -rf config/sublime-text ~/.config/
cp -rf config/autostart ~/.config/
cp -rf config/fd ~/.config/
cp -rf config/joshuto ~/.config/
cp -rf config/Thunar ~/.config/
mkdir ~/Pictures
cp scripts/scr.sh ~/Pictures/
cp -rf scripts ~/
echo "done."

## theme/icon ?

echo "echo performance | sudo tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor" >> ~/.bash_profile
