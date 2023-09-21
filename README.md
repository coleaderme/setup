# setup

## Pre-requisites before using script:

**Manage your own disk partition**
i.e. mounting:
    /dev/sdX1 --> /boot # 100 MB
    /dev/sdX2 --> / (root) # about 8-16 GB is sufficient for average install.
    /dev/sdX3 --> /home # rest or desired space goes for user(s).
(Swap is not recommended)       
__note: /dev/sdXY **XY** can be different.__
make changes according to your setup carefully.

### How to manage disk partition:

use `cfdisk /dev/sdX` # X is physical disk on which you desire to make partitions.
to verify partition `lsblk`.

You should see similar to this ->

    NAME   MAJ:MIN RM   SIZE RO TYPE MOUNTPOINTS
    sda      8:0    0 498.1G  0 disk
    ├─sda1   8:1    0   100M  0 part
    ├─sda2   8:2    0    16G  0 part 
    └─sda3   8:3    0    64G  0 part 

### Formatting with EXT4 FileSytem :
- `mkfs.ext4 /dev/sda2` # note: /dev/sdXY **XY** can be different.
- `mkfs.ext4 /dev/sda3` # note: /dev/sdXY **XY** can be different.

### Mount :
- `mkdir /mnt`
- `mkdir /mnt/home`
- `mount /dev/sda2 /mnt`
- `mount /dev/sda3 /mnt/home`
`lsblk` to verify.

**Read each script before running it.**
:)

## Slow download speed?:
`pacman -S reflector rsync`
`reflector --threads 5 --sort rate --country AU,GB --age 6 --fastest 20 --protocol https --ipv4 --save /etc/pacman.d/mirrorlist`

### google docs useful-stuff-found-mini-wiki:
https://docs.google.com/document/d/1n4g8nYFDroHMy6fbYHAyRVx64HswYeQoAvtRxHw_EsM/edit