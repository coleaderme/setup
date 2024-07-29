#!/usr/bin/sh
# sudo sh startx_dwm.sh [root]
#
## install dwm
git clone https://github.com/coleaderme/dwm && cd dwm && sudo make install -j2 && cd ..
## install st
git clone https://github.com/coleaderme/st && cd st && sudo make install -j2 && cd ..
## dmenu
git clone https://git.suckless.org/dmenu && cp config/dmenu/config.h dmenu/ && cd dmenu && sudo make install -j2 && cd ..
## slstatus
git clone https://git.suckless.org/slstatus && cp config/slstatus/config.h slstatus/ && cd slstatus && sudo make install -j2 && cd ..
## wallpaper
sudo mkdir -p /usr/share/backgrounds/xfce
sudo cp wallpaper/Supernatural-Wallpaper.png /usr/share/backgrounds/xfce/Supernatural-Wallpaper.png
## xinit
sudo cp startx_xyz/xinitrc_dwm /etc/X11/xinit/xinitrc
echo "You may reboot now."
