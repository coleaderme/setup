#!/usr/bin/sh
# sh packages.sh
#
# This file should be in HOME directory of USER.
# To get permission for setup files do;
# sudo chown -R $USER setup/'
#
# Common Programs + window manager.
#
echo "========================================================"
echo "[!] run as USER on first login"
echo "========================================================"
echo ''
echo "[Choose your desktop]: "
echo "dwm.sh   >> [ultrafast, extreme lightweight, tiling]"
echo "i3wm.sh  >> [fast, lightweight, tiling]"
echo "xfce4.sh >> [normal, desktop, windows]"

w=$(printf "1. dwm\n2. i3wm\n3. xfce" | fzf)
[ -z "$w" ] && echo "none selected" && exit 1

# Installs
sudo pacman -Syy
sudo pacman -S --needed xorg-server xorg-xinit xorg-xset ntfs-3g \
ttf-inconsolata noto-fonts noto-fonts-emoji \
alsa-utils wireguard-tools openresolv wgcf viewnior xsel scrot \
aria2 mpv dmenu clipmenu htop p7zip \
ripgrep fd sd fzf choose lf numlockx \
earlyoom thunar eza micro
## micro: supports ctrl+d to duplicate line, ctrl+q quit, ctrl+c, ctrl+v auto complete()""''
## jq jless (for json), uv for python pip-alternative
## fend (calc)
## herbe (minimal popup notification) [from github]
## code-oss (vscode opensource build) with exts -> ruff + python + cody (free ver)
## android-tools gvfs gvfs-mtp (android device support)
## woeusb: windows usb
## usbimager: linux usb
git clone https://aur.archlinux.org/yay-bin.git && cd yay-bin && makepkg -sic

# config files / dotfiles
echo "[+] copying confs to ~/.config"
mkdir ~/.config
cp config/psd ~/.config/
cp config/bashrc ~/.bashrc
cp config/nanorc ~/.nanorc
cp config/mpv ~/.config/
cp config/htop ~/.config/
cp config/angrysearch ~/.config/
cp config/sublime-text ~/.config/
cp config/chromium-flags.conf ~/.config/
cp config/thorium-flags.conf ~/.config/
cp config/code-flags.conf ~/.config/
cp config/chrome-flags.conf ~/.config/
cp config/autostart ~/.config/
cp config/broot ~/.config/
cp config/fd ~/.config/
cp config/lf ~/.config/
cp config/Thunar ~/.config/
mkdir ~/Pictures
cp scripts/scr.sh ~/Pictures/
cp scripts ~/
## Theme & icons
mkdir ~/.themes
mkdir ~/.icons
## Mac theme
tar -xf wallpaper/Os-Catalina-icons.tar.xz
7z x wallpaper/Gn-OSX-XFCE-Edition.7z
cp Gn-OSX-XFCE-Edition-1.2 ~/.themes/
cp Os-Catalina-Night ~/.icons/
cp Os-Catalina-icons ~/.icons/

echo "echo performance | sudo tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor" >> ~/.bash_profile
case "$w" in
    *dwm*) sh startx_dwm.sh ;;
    *i3*) sh startx_i3-wm.sh ;;
    *xfce*) sh startx_xfce4.sh ;;
esac
