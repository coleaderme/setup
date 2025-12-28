#!/usr/bin/sh
# sh s3-desktop_install.sh [USER]

## install dwm
git clone --depth 1 https://github.com/coleaderme/dwm && cd dwm && make clean install && cd ..
## install st
git clone --depth 1 https://github.com/coleaderme/st && cd st && make clean install && cd ..
## dmenu
git clone --depth 1 https://github.com/coleaderme/dmenu && cd dmenu && make clean install && cd ..
## slstatus
git clone --depth 1 https://git.suckless.org/slstatus && cp config/slstatus/config.h slstatus/ && cd slstatus
sed -i 's/PREFIX = \/usr\/local/PREFIX = $(HOME)\/.local/' config.mk #
make clean install && cd ..
## wallpaper
cp wallpaper/Supernatural-Wallpaper.png ~/Pictures/Supernatural-Wallpaper.png
## xinit
cp startx_xyz/xinitrc_dwm ~/.xinitrc
echo "You may reboot now."
