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

w=$(echo "1. dwm\n2. i3wm\n3. xfce" | fzf)
[ -z "$w" ] && echo "none selected" && exit 1

# Installs
sudo pacman -Syy
sudo pacman -S --needed xorg-server xorg-xinit xorg-xset ntfs-3g \
ttf-inconsolata noto-fonts noto-fonts-emoji \
alsa-utils wireguard-tools openresolv wgcf viewnior xsel scrot \
aria2 mpv dmenu clipmenu htop p7zip \
ripgrep fd sd fzf choose lf numlockx earlyoom thunar eza
## jq jless (for json)
## fend (calc)
## required for android devices: android-tools gvfs gvfs-mtp
## woeusb: windows usb
## usbimager: linux usb
git clone https://aur.archlinux.org/yay-bin.git && cd yay-bin && makepkg -sic

# config files / dotfiles
echo "[+] moving confs to ~/.config"
mkdir ~/.config
mv config/psd ~/.config/
mv config/bashrc ~/.bashrc
mv config/mpv ~/.config/
mv config/htop ~/.config/
mv config/angrysearch ~/.config/
mv config/sublime-text ~/.config/
mv config/chromium-flags.conf ~/.config/
mv config/thorium-flags.conf ~/.config/
mv config/code-flags.conf ~/.config/
mv config/chrome-flags.conf ~/.config/
mv config/autostart ~/.config/
mv config/broot ~/.config/
mv config/fd ~/.config/
mv config/lf ~/.config/
mv config/Thunar ~/.config/
mkdir ~/Pictures
mv scripts/scr.sh ~/Pictures/
mv scripts ~/
## Theme & icons
mkdir ~/.themes
mkdir ~/.icons
tar -xf wallpaper/Os-Catalina-icons.tar.xz
7z x wallpaper/Gn-OSX-XFCE-Edition.7z
mv Gn-OSX-XFCE-Edition-1.2 ~/.themes/
mv Os-Catalina-Night ~/.icons/
mv Os-Catalina-icons ~/.icons/
echo "echo performance | sudo tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor" >> ~/.bash_profile
case "$w" in
    *dwm*) sh startx_dwm.sh ;;
    *i3*) sh startx_i3-wm.sh ;;
    *xfce*) sh startx_xfce4.sh ;;
esac
