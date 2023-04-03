#!/usr/bin/bash
sudo pacman -Syy
sudo pacman -S xorg xorg-server xfce4 gvfs gvfs-mtp ntfs-3g noto-fonts noto-fonts-emoji noto-fonts-cjk alsa-utils xfce4-clipman-plugin viewnior mpv htop p7zip xarchiver
curl -s 'https://download.opensuse.org/repositories/home:/ungoogled_chromium/Arch/x86_64/home_ungoogled_chromium_Arch.key' | sudo pacman-key -a -
echo '
[home_ungoogled_chromium_Arch]
SigLevel = Required TrustAll
Server = https://download.opensuse.org/repositories/home:/ungoogled_chromium/Arch/$arch' | sudo tee --append /etc/pacman.conf
sudo pacman -Syu
sudo pacman -S ungoogled-chromium
