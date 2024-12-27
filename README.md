# setup
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
NOTE: **DO NOT** format this /boot/efi partition if Windows installed.   
NOTE: **DO NOT** format this /boot/efi partition if Windows installed.   
- `mkfs.fat -F 32 /dev/sda1             #/boot/efi`   
just format these two if Windows installed :  
- `mkfs.ext4 /dev/sda2                  #/`   
- `mkfs.ext4 /dev/sda3                  #/home`   

#### Mount :
- `mount --mkdir /dev/sda1 /mnt/boot/efi`   
- `mount --mkdir /dev/sda2 /mnt`   
- `mount --mkdir /dev/sda3 /mnt/home`   

`lsblk` to verify.  

**Read each script before running it.**  
  *:)*  

## Lets go!:  
NOTE: Replace `intel-ucode` with `amd-ucode` for AMD CPU.  

- `pacstrap -K /mnt base base-devel linux linux-headers linux-firmware git fzf nano sd intel-ucode`  
- `genfstab -U /mnt >> /mnt/etc/fstab`  
- `arch-chroot /mnt`  we are now in newly mount / (root)  
- `git clone https://github.com/coleaderme/setup`  
- `bash s1-base_install.sh` follow this script.  

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
Fix slow download speeds:  
- `pacman -S --needed reflector rsync`  
- `reflector --threads 5 --sort rate --country AU,GB,IN --age 6 --fastest 20 --protocol https --ipv4 --save /etc/pacman.d/mirrorlist`  
- Install `dnscrypt-proxy` to bypass ISP's dns / fix download timeouts.
    `systemctl disable dnscrypt-proxy.socket && systemctl enable dnscrypt-proxy.service`  

## Extras

`fc-list`: show correct font names to be used dmenu/dwm config.  

### Alsa EQ setup:  
Dependancies   
install `caps` or download http://quitte.de/dsp/caps_0.9.26.tar.bz2  
add this to ~/.bashrc `export LADSPA_PATH=/usr/lib/ladspa` (this fixes cap.so cant locate error)  
```shell  
$ tar xfj caps_0.9.26.tar.bz2
$ cd caps-0.9.26
$ ./configure.py
$ make
$ sudo make install
```  
installations   
```shell
$ git clone https://github.com/bassdr/alsaequal
$ cd alsaequal
$ make
$ sudo make install
```

### Mounting drives as USER:
install: `sudo pacman -S gvfs gvfs-mtp thunar thunar-volman polkit`
edit `sudo nano /etc/polkit-1/rules.d/10-udisks2.rules`
```
// Allow udisks2 to mount devices without authentication
// for users in the "storage" group.
polkit.addRule(function(action, subject) {
    if ((action.id == "org.freedesktop.udisks2.filesystem-mount-system" ||
         action.id == "org.freedesktop.udisks2.filesystem-mount") &&
    subject.isInGroup("storage")) {
        return polkit.Result.YES;
    }
});
```
