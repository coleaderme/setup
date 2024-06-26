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

# Installs (via pacman)
sudo pacman -Syy
sudo pacman -S --needed xorg-server xorg-xinit xorg-xset ntfs-3g \
ttf-inconsolata ttf-arphic-ukai noto-fonts ttf-noto-emoji-monochrome \
alsa-utils wireguard-tools openresolv wgcf viewnior xsel scrot \
aria2 mpv dmenu clipmenu htop p7zip \
ripgrep fd sd fzf skim choose numlockx \
systemd-oomd-defaults thunar eza micro
## joshuto-bin (via yay) user friendly! TUI file explorer.
## micro: supports ctrl+d to duplicate line, ctrl+q quit, ctrl+c, ctrl+v auto complete()""''
## jq jless (for json), uv for python-pip and venv alternative
## fend (calc)
## herbe (minimal popup notification) [from github]
## code-oss (vscode opensource build) with exts -> ruff + python + cody (free ver)
## android-tools gvfs gvfs-mtp (android device support)
## woeusb: windows usb creator
## usbimager: linux usb creator

git clone https://aur.archlinux.org/yay-bin.git && cd yay-bin && makepkg -sic
# Installs (via yay)
yay -S joshuto-bin

# config files / dotfiles
echo "[+] copying confs to ~/.config"
mkdir ~/.config
cp config/*.conf ~/.config/
cp -rf config/psd ~/.config/
cp -rf config/bashrc ~/.bashrc
cp -rf config/nanorc ~/.nanorc
cp -rf config/mpv ~/.config/
cp -rf config/htop ~/.config/
cp -rf config/sublime-text ~/.config/
cp -rf config/autostart ~/.config/
cp -rf config/fd ~/.config/
cp -rf config/joshuto ~/.config/
cp -rf config/Thunar ~/.config/
mkdir ~/Pictures
cp scripts/scr.sh ~/Pictures/
cp -rf scripts ~/
echo "done."
## Theme & icons
mkdir ~/.themes
mkdir ~/.icons
## Mac theme
echo "[+] extracting/copying theme"
tar -xf wallpaper/Os-Catalina-icons.tar.xz
7z x wallpaper/Gn-OSX-XFCE-Edition.7z
cp -rf Gn-OSX-XFCE-Edition-1.2 ~/.themes/
cp -rf Os-Catalina-Night ~/.icons/
cp -rf Os-Catalina-icons ~/.icons/
echo "done."

echo "echo performance | sudo tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor" >> ~/.bash_profile
case "$w" in
    *dwm*) sh startx_dwm.sh ;;
    *i3*) sh startx_i3-wm.sh ;;
    *xfce*) sh startx_xfce4.sh ;;
esac
