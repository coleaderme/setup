#!/usr/bin/sh
# mount drive
main(){
    d=$(lsblk -n -l -o NAME,SIZE,FSTYPE,LABEL,MOUNTPOINTS | dmenu -p "Mount Drive:" -i -l 12 | choose 0)
    [ -z "$d" ] && exit # exit if empty
    mountpoint=$(printf "D\nE\nF\nG\n" | dmenu -p "mount point: " -i -l 4)
    [ -z "$mountpoint" ] && exit # exit if empty
    sudo mount --mkdir "/dev/$d" "$HOME/$mountpoint" -o noatime
    herbe "Mounted: $d to ~/$mountpoint"
    exit
}

case "$1" in
    sd*) d="$1" ;; # via cli
    *) main ;; # via dmenu
esac

# exit if empty
[ -z "$2" ] && printf "./mountsd sdXY myfolder\nmust be related to HOME" && exit
sudo mount "/dev/$d" "$HOME/$2" -o noatime # $HOME/ is better.
