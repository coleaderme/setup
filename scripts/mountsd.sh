#!/usr/bin/sh
d=$(lsblk -n -l -o NAME,SIZE,FSTYPE,LABEL,MOUNTPOINTS | dmenu -p "Mount Drive:" -i -l 12 -fn InconsolataSemiCondensedBold | choose 0)
[ -z $d ] && exit
sudo mount /dev/$d ~/sd/ -o noatime,umask=000