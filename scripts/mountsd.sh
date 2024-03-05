#!/usr/bin/sh
# mount drive
main(){
    d=$(lsblk -n -l -o NAME,SIZE,FSTYPE,LABEL,MOUNTPOINTS | dmenu -p "Mount Drive:" -i -l 12 | choose 0)
    [ -z "$d" ] && exit # if none
    sudo mount "/dev/$d" ~/sd/ -o noatime,umask=000
    herbe "Mounted: $d to ~/sd"
    exit
}

case "$1" in
    /dev/sd*) d="$1";;
    *)main;;
esac

# exit if none
[ -z "$2" ] && printf "./mountsd /dev/sdXY myfolder\nmust be related to HOME" && exit
sudo mount "$d" ~/"$2" -o noatime,umask=000
