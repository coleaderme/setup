#!/usr/bin/sh
# clone as user, run as user.
# Do NOT run as sudo.
# just: sh startx_dwm.sh
sudo pacman -S --needed feh
## install dwm
git clone https://github.com/coleaderme/dwm && cd dwm && sudo make install -j2
cd ..
## install st
git clone https://github.com/coleaderme/st
#~mv config/st/config.h st/
cd st
sudo make install -j2
cd ..
## wallpaper
sudo mkdir -p /usr/share/backgrounds/xfce
sudo mv wallpaper/Supernatural-Wallpaper.png /usr/share/backgrounds/xfce/Supernatural-Wallpaper.png
sudo mv startx_xyz/xinitrc_dwm /etc/X11/xinit/xinitrc
echo "You may reboot now."
