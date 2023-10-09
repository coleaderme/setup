#!/usr/bin/sh
# usage:
#   ./mountsd.sh sdc1
# old # sudo mount /dev/$1 ~/sd/ -o noatime,umask=000
d=$(lsblk -n -l -o NAME,SIZE,FSTYPE,LABEL,MOUNTPOINTS | dmenu -p "External Drive:" -l 12 -fn InconsolataSemiCondensedBold | choose 0)
[ -z $d ] && exit
# echo "Mounting: [$d] at ~/sd/" | dmenu -l 1 -fn InconsolataSemiCondensedBold
sudo mount /dev/$d ~/sd/ -o noatime,umask=000