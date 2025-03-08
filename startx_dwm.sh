#!/usr/bin/sh

## install dwm
git clone https://github.com/coleaderme/dwm && cd dwm && make install -j2 && cd ..
## install st
git clone https://github.com/coleaderme/st && cd st && make install -j2 && cd ..
## dmenu
git clone https://git.suckless.org/dmenu && cp config/dmenu/config.h dmenu/ && cd dmenu && make install -j2 && cd ..
## slstatus
git clone https://git.suckless.org/slstatus && cp config/slstatus/config.h slstatus/ && cd slstatus && make install -j2 && cd ..
## wallpaper
mkdir -p /usr/share/backgrounds/xfce
cp wallpaper/Supernatural-Wallpaper.png /usr/share/backgrounds/xfce/Supernatural-Wallpaper.png
## xinit
cp startx_xyz/xinitrc_dwm /etc/X11/xinit/xinitrc
echo "You may reboot now."
