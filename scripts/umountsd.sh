#!/usr/bin/sh
d=$(lsblk -n -l -o NAME,SIZE,FSTYPE,LABEL,MOUNTPOINTS | dmenu -p "Eject Drive:" -i -l 12 -fn InconsolataSemiCondensedBold | choose -1)
[ -z $d ] && exit
case "$d" in
    \/) exit;;
    \/home) exit;;
    \/home\/*) sudo umount $d;;
    *) echo "$d" | dmenu -p "[-] Invalid Eject Drive: ";;
esac