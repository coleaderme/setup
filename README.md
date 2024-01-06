# google docs useful-stuff-mini-wiki:
https://docs.google.com/document/d/1n4g8nYFDroHMy6fbYHAyRVx64HswYeQoAvtRxHw_EsM/edit

# setup
## Overview : 

## Pre-requisites before using script : 

**Manage your own disk partition**

i.e. mounting:

    /dev/sdX1 --> /boot # 100 MB
    /dev/sdX2 --> / (root) # about 8|16 GB is sufficient for minimal|average install.
    /dev/sdX3 --> /home # rest or desired space goes to user(s).

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
- `mount /dev/sda2 /mnt`
- `mkdir /mnt/home`
- `mount /dev/sda3 /mnt/home` 

`lsblk` to verify.  

**Read each script before running it.**  
  *:)*  

## Lets get started:  
replace intel-ucode with amd-ucode for AMD CPU.  
- `pacstrap -i /mnt base base-devel linux-lts linux-lts-headers linux-firmware intel-ucode git nano dhcpcd dash sd`  
- `genfstab -U /mnt >> /mnt/etc/fstab`    
  
  
- `arch-chroot /mnt`  
Mount partition with ~100MB size:  
- `mkdir /boot/efi`  
- `mount /dev/sdX1 /boot/efi`  
   
- `git clone https://github.com/coleaderme/setup`  

in **arch-chroot /mnt**: `bash base_install.sh`   
  
Arch linux installed successfully.  
If all went well, you should be able to login with user and passwd (not shown).  
Welcome to tty! (blank terminal)  

## On first time user login:  
Copy /setup to ~/   
- `sudo cp /setup ~/`   
- `sudo chown -R $USER setup/`  
- `sh packages.sh`: Installs basic programs and copy their configs.     

## Choose your desktop:  
1. dwm    [ultrafast, extreme lightweight, tiling]  
2. i3-wm  [fast, lightweight, tiling]  
3. xfce4  [normal, desktop, windows]  


## Troubleshooting: 
#### Fix slow download speeds:  
- `pacman -S --needed reflector rsync`  
- `reflector --threads 5 --sort rate --country AU,GB,IN --age 6 --fastest 20 --protocol https --ipv4 --save /etc/pacman.d/mirrorlist`  
