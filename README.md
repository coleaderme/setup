# google docs useful-stuff-mini-wiki:
https://docs.google.com/document/d/1n4g8nYFDroHMy6fbYHAyRVx64HswYeQoAvtRxHw_EsM/edit

# setup
## Overview : 
**NOT meant for others, though process if very simple, can be tailored for any other systems.**


## Pre-requisites before using script : 

**Manage your own disk partition**

i.e. mounting:

    /dev/sdX1 --> /boot # 100 MB
    /dev/sdX2 --> / (root) # about 8-16 GB is sufficient for average install.
    /dev/sdX3 --> /home # rest or desired space goes for user(s).

(Swap is not recommended)       

*note: /dev/sdXY **XY** can be different.*
Make changes according to your setup carefully.

#### How to manage disk partition:

`cfdisk /dev/sdX` X is disk(such as 512GB HDD/SSD) on which you've to create partitions.

`lsblk` to verify.

You should see similar to this ->

    NAME   MAJ:MIN RM   SIZE RO TYPE MOUNTPOINTS
    sda      8:0    0 498.1G  0 disk
    ├─sda1   8:1    0   100M  0 part    # /boot
    ├─sda2   8:2    0    16G  0 part    # /
    └─sda3   8:3    0    64G  0 part    # /home

#### Formatting with EXT4 FileSytem :
- `mkfs.ext4 /dev/sda2` note: /dev/sdXY **XY** can be different.
- `mkfs.ext4 /dev/sda3` note: /dev/sdXY **XY** can be different.

#### Mount :
- `mkdir /mnt`
- `mkdir /mnt/home`
- `mount /dev/sda2 /mnt`
- `mount /dev/sda3 /mnt/home`

`lsblk` to verify.  

**Read each script before running it.**  
  :)

## Fix slow download speeds:  
`pacman -S --needed reflector rsync`  
`reflector --threads 5 --sort rate --country AU,GB,IN --age 6 --fastest 20 --protocol https --ipv4 --save /etc/pacman.d/mirrorlist`  

## Lets get started: 
`install_stage_one.sh`  

`arch-chroot`  
Mount partition with ~100MB size:  
`mkdir /boot/efi`  
`mount /dev/sdX1 /boot/efi`  

**Post-chroot**: `install_stage_two.sh`

Arch linux installed successfully.  
If all went well, you should be able to login with user and passwd (not shown).  
Welcome to tty! (blank terminal)  

## On first time user login:  
`packages.sh`: Installs basic programs and copy their configs.  

## Choose your desktop:  
`startx_dwm.sh`    [ultrafast, extreme lightweight, tiling]  
`startx_i3-wm.sh`  [fast, lightweight, tiling]  
`startx_xfce4.sh`  [normal, desktop, windows]  

