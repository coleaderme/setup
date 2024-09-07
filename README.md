# google docs useful-stuff-mini-wiki:
https://docs.google.com/document/d/1n4g8nYFDroHMy6fbYHAyRVx64HswYeQoAvtRxHw_EsM/edit

# setup
## Overview : 

## Pre-requisites before using script : 

**Manage your own disk partition**

i.e. mounting:

    /dev/sdX1 --> /boot     # 512 MB
    /dev/sdX2 --> / (root)  # about 8|16 GB is sufficient for minimal|average install.
    /dev/sdX3 --> /home     # rest/desired space goes to user(s).

(Swap is not recommended)       

*note: /dev/sdXY **XY** can be different.*
Make changes according to your setup carefully.

#### How to manage disk partition:

`cfdisk /dev/sdX` X is disk(such as 512GB HDD/SSD) on which you've to create partitions.

`lsblk` to verify.

You should see similar to this ->

    NAME   MAJ:MIN RM   SIZE RO TYPE MOUNTPOINTS
    sda      8:0    0 498.1G  0 disk
    ├─sda1   8:1    0   512M  0 part    # /boot/efi 
    ├─sda2   8:2    0    16G  0 part    # /
    └─sda3   8:3    0    64G  0 part    # /home

#### Formatting with EXT4 FileSytem :
NOTE: **DO NOT** format this /boot/efi partition if Windows installed.   
- `mkfs.fat -F 32 /dev/sda1`   

just format these two:  
- `mkfs.ext4 /dev/sda2`   
- `mkfs.ext4 /dev/sda3`   


#### Mount :
- `mount --mkdir /dev/sda1 /mnt/boot/efi`   
- `mount --mkdir /dev/sda2 /mnt`   
- `mount --mkdir /dev/sda3 /mnt/home`   

`lsblk` to verify.  

**Read each script before running it.**  
  *:)*  

## Lets go!:  
Replace `intel-ucode` with `amd-ucode` for AMD CPU.  

- `pacstrap -K /mnt base base-devel linux linux-headers linux-firmware intel-ucode git fzf nano sd`  

- `genfstab -U /mnt >> /mnt/etc/fstab`  
    
- `arch-chroot /mnt`  we are now in newly mount / (root)  
   
- `git clone https://github.com/coleaderme/setup`  

- `bash base_install.sh` follow this script then reboot.  

  
Arch linux installed successfully.  
If all went well, you should be able to login with user and passwd (not shown).  
Welcome to tty! (a blank terminal)  


## On first login as user:  
Copy /setup to ~/  
- `sudo cp /setup ~/`  
- `sudo chown -R $USER setup/`  
- `sudo sh packages.sh`: Installs programs.  

## Choose your desktop:  
- `sh desktop_install.sh`: Installs desktop.  

1. dwm    [ultrafast, extreme lightweight, tiling]  
2. i3-wm  [fast, lightweight, tiling]  
3. xfce4  [normal, desktop, windows]  


## Troubleshooting: 
#### Fix slow download speeds:  
- `pacman -S --needed reflector rsync`  

- `reflector --threads 5 --sort rate --country AU,GB,IN --age 6 --fastest 20 --protocol https --ipv4 --save /etc/pacman.d/mirrorlist`  

- `fc-list`: show correct font names to be used dmenu/dwm config.  

