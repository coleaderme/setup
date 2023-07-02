# setup
google docs mini-wiki: https://docs.google.com/document/d/1n4g8nYFDroHMy6fbYHAyRVx64HswYeQoAvtRxHw_EsM/edit


# Theme
- **McOS-MJV-Dark-XFCE-Edition-2.3.tar Created by PAULXFCE (2017)**   
    https://github.com/paullinuxthemer   

- **WhiteSur_icons.tar.xz**  
    SOURCES:  
    OSX_ONE: https://github.com/unc926/OSX_ONE   
    zayronxio: https://github.com/zayronxio/Os-Catalina-icons   
      
    CUSTOMIZER:   
    Vince Liuice <vinceliuice@hotmail.com>: https://github.com/vinceliuice/WhiteSur-icon-theme  
# ---------------------------------------------------------------------------------------------
<!-- Output copied to clipboard! -->

<!-----

Yay, no errors, warnings, or alerts!

Conversion time: 0.909 seconds.


Using this Markdown file:

1. Paste this output into your source file.
2. See the notes and action items below regarding this conversion run.
3. Check the rendered output (headings, lists, code blocks, tables) for proper
   formatting and use a linkchecker before you publish this page.

Conversion notes:

* Docs to Markdown version 1.0β34
* Sat Jul 01 2023 23:40:09 GMT-0700 (PDT)
* Source doc: Arch
----->


KEYBOARD Shortcuts: - (pulseaudio / pipewire not required, _except for firefox_)

Super+Printscreen:

gnome-screenshot -f ~/Pictures/screenshot_$(date "+%Y%m%d%H%M%S").png

Alt+] amixer set Master 1+

Alt+[ amixer set Master 1-

Alt+\ amixer set Front toggle

**********************************************************************

<sub>PACKAGES:</sub>

sudo pacman -S gvfs gvfs-mtp ntfs-3g alsa-utils noto-fonts noto-fonts-cjk

noto-fonts-emoji xfce4-clipman-plugin

install YAY `git clone https://aur.archlinux.org/yay-bin.git && cd yay-bin && makepkg -sic`

..WINE installation w/ audio..

>install wine lib32-alsa-plugins&lt;

*************************************************************

<sub>Commands:</sub>

sudo timedatectl set-ntp true



* Save it as scrsht.sh in ~/Pictures

gnome-screenshot -f "/home/dra/Pictures/$(date +"%j%H%M%S.png")"



* _Best speed based on test _8.8.8.8, 8.8.4.4

sudo ip link set &lt;interface name> mtu 1464



* Mount NTFS

sudo mount -noatime /dev/sda4 /home/dra/C

sudo umount /dev/sda4



* Disable Watchdog timers

	sudo nano /etc/systemd/system.conf

_&lt;uncomment watchdog related lines>_

	sudo systemctl daemon-reload

sudo reboot



* Magic Sysrq key {Alt+Prntsc+e} su

    	echo "1" > /proc/sys/kernel/sysrq


    put this in grub-customizer boot-parameters, [Space] sysrq_always_enabled


    ++ append in **/etc/systemd/system.conf**


Export FLAGS - ungoogled Chromium

/home/dra/.config/chromium/ <span style="text-decoration:underline;">localstate</span>

********************************************************


## [FIX Bootloader Arch]

;boot into arch iso

;identify boot partition (100mb)

>lsblk

>mkdir /boot/efi

>mount /dev/sdXY /boot/efi

>pacman -S grub efibootmgr dosfstools mtools os-prober

>grub-install --target=x86_64-efi --bootloader-id=grub_efi --recheck

>grub-mkconfig -o /boot/grub/grub.cfg

>umount -lR /mnt

>reboot

;done



* Starting XFCE

    sudo nano /etc/X11/xinit/xinitrc


    Add this line to bottom.


    exec xfce4-session [OR] exec startxfce4

* Clear package cache [Fix]

	sudo pacman -Sc

sudo pacman -Scc

*************************************************************


## &lt;FIX pacman Download Speed> (use wireguard..)

sudo cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.bkp


```
curl -s "https://archlinux.org/mirrorlist/?country=IN&protocol=https&use_mirror_status=on" | sed -e 's/^#Server/Server/' -e '/^#/d' | rankmirrors -n 5 -
visit https://archlinux.org/mirrorlist/ copy output to /etc/pacman.d/mirrorlist
```


**************************************************************************

**profile cache on RAM**

**install <code>p[rofile-sync-daemon](https://archlinux.org/packages/?name=profile-sync-daemon)</code> </strong>

**edit ~/.config/pwd.conf**


```
systemctl --user enable psd.service
```


**<code>psd preview &lt;< </code>to check</strong>

******************************************************************


## &lt;BTRFS Better HHD performance>


```
# Static information about the filesystems.
# See fstab(5) for details.

# <file system> <dir> <type> <options> <dump> <pass>
# /dev/sdb6
UUID=2286ec45-fc3f-4c06-ba8d-5f3120c39b50	/         	btrfs     	rw,compress=zstd,nodatacow,inode_cache,noatime,space_cache=v2,subvolid=5,subvol=/	0 0

# /dev/sdb7
UUID=67766270-da7f-4f5c-80d7-8b6dd4c8df6a	/home     	btrfs     	rw,compress=zstd,nodatacow,inode_cache,noatime,space_cache=v2,subvolid=5,subvol=/	0 0

# /dev/sdb8
UUID=807ecf4f-2f14-461e-b73f-4dafea700ac0	none      	swap      	rw,compress=zstd,nodatacow,noatime  	0 0
```


********************************************************************

So, let’s say we want to switch from <code><em>powersave</em></code> mode to <code><em>performance</em></code> mode, we will do:


```
$ echo performance | tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor
```


And if we want to switch back to <code><em>powersave</em></code> mode, we will do:


```
$ echo powersave | tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor
```


And to get our current CPU mode, we will type:


```
$ cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
```



## Create venv in current directory

python -m venv .

source bin/activate

pip install xyz-anything


## Creating Bootable Windows USB on linux

install woeusb

sudo woeusb --device en_windows_7_ultimate_x64_dvd.iso /dev/sdX _&lt;- USB_




## Disable watchdog timer

sudo nano /etc/systemd/system.conf

.. **_<span style="text-decoration:underline;">append these lines.</span>_**

sysrq_always_enabled

RuntimeWatchdogSec=0

RuntimeWatchdogPreSec=off

RebootWatchdogSec=0

KExecWatchdogSec=off

..




## Change font in i3-wm

install lxappearance and **_noto-fonts _**pack

run lxappearance in terminal and set to **_Noto Sans:size 10 (do same for sudo too.)_**


## zram

sudo nano /etc/systemd/zram-generator.conf


```
[zram0]
zram-size = 2048
compression-algorithm = lz4
```


- disabled for now. &lt;Using one mentioned below>


## zswap [kernal boot parameters]

[wiki](https://wiki.archlinux.org/title/zswap)


```
zswap.enabled=1 zswap.compressor=lz4 zswap.max_pool_percent=20 zswap.zpool=z3fold
```


added this in _/boot/loader/enteries/*linux-zen.conf _


## Widen stereo in Audacious


```
Effect >> Extra stereo >> 2.2 (seems fine..)
```



## Curated list of rust cli tools

- `ripgrep` (faster grep)

- `fend-bin` (calc+converter) (AUR)

- `miniserve` (better than `python -m server` + _has themes!_ ) [Windows too]

- `tgpt-bin`: chat gpt in terminal ([AUR](https://aur.archlinux.org/packages/tgpt-bin))

[A curated list of command-line utilities written in Rust · GitHub](https://gist.github.com/sts10/daadbc2f403bdffad1b6d33aff016c0a)


## Yay installs (AUR)


```
clipmenu (a dmenu based clipboard manager)
```



## xterm fonts config

[source](https://askubuntu.com/a/1138738) \
**<code>nano ~/.Xresources \
 \
! Use a truetype font and size.</code></strong>


```
xterm*faceName: Monospace
xterm*faceSize: 14

xrdb -merge ~/.Xresources
```



## M4A "error reading header"


```
answer
install gpac
```


**<code>MP4Box -add in.m4a -new out.m4a \
 \
</code></strong>Still not fixed?



* Import in audacity and export to .**flac OR USE FFMPEG**
* play **.flac **(not plays? bad luck)
    * if that **_plays properly_**, you may than convert it to any other format (_will degrade quality_).
    * for least quality degrade_ _on lossless to lossy convertion, use **foobar **+ **qaac encoder **to convert \
.flac to .m4a


## No write permission? (usb drives)


```
sudo mount /dev/sdXY ~/mountpoint -o noatime,umask=000
```



## Github ssh


```
ssh-keygen -t ed25519 -C "YOUR-EMAIL"
```


copy the .pub key content to and paste in _github edit profile >> ssh-keys >> key_

now git clone using _ssh_ instead of https


```
git clone git@github.com:someone/project.git
```



## Easyeffects | EQ & stuff..

**_install_** **<code>pipewire-alsa pipewire-pulse easyeffects lsp-plugins</code></strong>


## [GLXBadFBConfig](https://askubuntu.com/questions/1369900/x-error-of-failed-request-glxbadfbconfig)

export MESA_GL_VERSION_OVERRIDE=4.5


## Windows **ei.cfg** _(put in sources/)_


```
[Channel]
OEM
[VL]
0

