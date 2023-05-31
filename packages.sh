#!/usr/bin/bash
sudo pacman -Syy
sudo pacman -S xorg-server xorg-xinit ntfs-3g noto-fonts noto-fonts-emoji alsa-utils wireguard-tools wgcf viewnior scrot aria2 yt-dlp python-brotli python-pip mpv htop p7zip tealdeer ripgrep exa profile-sync-daemon fastfetch
git clone https://aur.archlinux.org/yay-bin.git && cd yay-bin && makepkg -sic
yay -S ungoogled-chromium-bin

#config files
mv psd ~/.config/
mv bashrc ~/.bashrc
mv mpv ~/.config/
mkdir ~/Pictures

echo "startx" >> ~/.bash_profile
echo "echo performance | sudo tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor" >> ~/.bash_profile

echo "open chromium then run this: systemctl --user enable psd.service"
echo 'END'