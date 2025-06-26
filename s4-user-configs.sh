#!/usr/bin/sh
# sh configs.sh [USER]

git clone https://aur.archlinux.org/yay-bin.git && cd yay-bin && makepkg -sic
# Installs (via yay)
yay -S joshuto-bin

# config files / dotfiles
echo "[+] copying confs to ~/.config"
mkdir ~/.config
cp config/*.conf ~/.config/
cp config/mimeapps.list ~/.config
cp -rf config/psd ~/.config/
cp -rf config/gtk-3.0 ~/.config/
cp -rf config/bashrc ~/.bashrc
cp -rf config/Xresources ~/.Xresources
cp -rf config/nanorc ~/.nanorc
cp -rf config/mpv ~/.config/
cp -rf config/micro ~/.config/
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
