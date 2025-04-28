#!/usr/bin/sh
# Run via s3-desktop_install.sh

## install dwm
git clone --depth 1 https://github.com/coleaderme/dwm && cd dwm && make clean install && cd ..
## install st
git clone --depth 1 https://github.com/coleaderme/st && cd st && make clean install && cd ..
## dmenu
git clone --depth 1 https://git.suckless.org/dmenu && cp config/dmenu/config.h dmenu/ && cd dmenu && make clean install && cd ..
## slstatus
git clone --depth 1 https://git.suckless.org/slstatus && cp config/slstatus/config.h slstatus/ && cd slstatus && make clean install && cd ..
## wallpaper
mkdir -p /usr/share/backgrounds/xfce
cp wallpaper/Supernatural-Wallpaper.png /usr/share/backgrounds/xfce/Supernatural-Wallpaper.png
## xinit
cp /etc/X11/xinit/xinitrc /etc/X11/xinit/xinitrc.bak &&  cp startx_xyz/xinitrc_dwm /etc/X11/xinit/xinitrc
echo "You may reboot now."
