#!/usr/bin/bash
# polkit (might require)
# Example: mount with UUID to ~/mydrive
# sudo mount -o noatime,user,prealloc,windows_names,umask=000 -t ntfs3 UUID=2A6E8459F17572 mydrive/
sudo mount -o noatime,user,prealloc,windows_names,umask=000 -t ntfs3 "$1" "$2"
