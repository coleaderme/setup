#!/usr/bin/sh
# usage:
#   ./mountsd.sh sdc1
# old # sudo mount /dev/$1 ~/sd/ -o noatime,umask=000
d=$(lsblk -n -l -o NAME,SIZE,FSTYPE,LABEL,MOUNTPOINTS | dmenu -p "External Drive:" -l 12 -fn InconsolataSemiCondensedBold | choose -1)
[ -z $d ] && exit
case "$d" in
    /) exit ;;
    /home) exit ;;
    /home/*) sudo umount "$d" ;;
esac