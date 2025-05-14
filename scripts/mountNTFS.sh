#!/usr/bin/bash
# polkit (require)
# Example: mount with UUID to ~/mydrive
#       sudo mount -o [...] -t ntfs3 UUID=2A6E8459F17572 mydrive/
sudo mount --mkdir -o defaults,noatime,user,windows_names,prealloc,nofail,async,umask=0022,fmask=0177,dmask=0077,uid=1000,gid=1000 -t ntfs3 "$1" "$2"