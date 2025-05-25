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

1. dwm    [extreme lightweight tiling]  
2. i3-wm  [lightweight tiling]  
3. xfce4  [normal desktop]  


## Troubleshooting:  

### Fix slow download speeds:  
- `pacman -S --needed reflector rsync`  
- `reflector --threads 5 --sort rate --country AU,GB,IN --age 6 --fastest 20 --protocol https --ipv4 --save /etc/pacman.d/mirrorlist`  
- Install `dnscrypt-proxy` to bypass ISP's dns / fix download timeouts.
    `systemctl disable dnscrypt-proxy.socket && systemctl enable dnscrypt-proxy.service`  

### Fix archlinux bootloader:  
*adjust XY for your partition*  

- `mount --mkdir -o noatime /dev/sdXY /mnt           #root`  

- `mount --mkdir -o noatime /dev/sdXY /mnt/boot/efi  #boot`  

- `arch-chroot /mnt`  

- `grub-install --target=x86_64-efi --bootloader-id=archfix --recheck`  

- `grub-mkconfig -o /boot/grub/grub.cfg`  

bootloader fixed!  

### Fix Windows bootloader:  
Create a bootable USB, during installation process at disk partion screen.  
Shift + F10 to open command prompt.  
```bash
diskpart
list disk
sel  disk # <- bootloader disk ~100MB in size
list vol
sel  vol  # <- bootloader partition/volume
assign letter=v
```

**CAUTION!**  
Do NOT format if this contains other bootloaders (eg. dual booting linux), you can skip this command.  
`format v: /fs:fat32`  
OR  
`format fs=fat32` (after selecting volume)  

- `exit` <- exit diskpart  
- `bcdboot c:\Windows /s v: /f UEFI`  (depending on your Win OS drive letter)  

windows bootloader fixed!  

## Extras

`fc-list`: show correct font names to be used dmenu/dwm config.  

### bashrc android termux   
qr image below contains this command:  
`curl https://raw.githubusercontent.com/coleaderme/setup/refs/heads/main/config/bashrc_android > ~/.bashrc && source ~/.bashrc`   

![bashrc android](misc/bashrc_android.png)  

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

### Auto Mount NTFS drives:  
get UUID -> `sudo blkid`  
edit `/etc/fstab`  
```
UUID=UUID_GOES_HERE       /home/user/data    ntfs     default,auto,nofail,noatime,windows_names,uid=1000,gid=1000,umask=022 0 0
```
