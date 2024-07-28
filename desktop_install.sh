#!/usr/bin/env sh
# Script [3/3]
# sh packages.sh [USER]
#
echo "[Choose your desktop]: "
echo "dwm.sh   >> [ultrafast, extreme lightweight, tiling]"
echo "i3wm.sh  >> [fast, lightweight, tiling]"
echo "xfce4.sh >> [normal, desktop, windows]"


w=$(printf "1. dwm\n2. i3wm\n3. xfce" | fzf)
[ -z "$w" ] && echo "none selected" && exit 1

case "$w" in
    *dwm*) sh startx_dwm.sh ;;
    *i3*) sh startx_i3-wm.sh ;;
    *xfce*) sh startx_xfce4.sh ;;
esac
