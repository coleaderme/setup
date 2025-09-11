#!/usr/bin/sh
# sh s3-desktop_install.sh [USER]
#
#
# dwm.sh   : ultrafast, extreme lightweight, tiling
# i3wm.sh  : fast, lightweight, tiling
# xfce4.sh : normal, desktop, windows


w=$(printf "1. dwm\n2. i3wm\n3. xfce" | fzf)
[ -z "$w" ] && echo "none selected" && exit

case "$w" in
    *dwm*) 	sudo sh startx_dwm.sh 	;;
    *i3*) 	sudo sh startx_i3-wm.sh ;;
    *xfce*) sudo sh startx_xfce4.sh ;;
esac
