#!/usr/bin/sh
# sudo sh packages.sh [ROOT]
# 
sudo pacman -Syy
sudo pacman -S --needed --noconfirm xorg-server xorg-xinit xorg-xset ntfs-3g \
ttf-inconsolata ttf-arphic-ukai ttf-indic-otf ttf-carlito noto-fonts-emoji \
alsa-utils wireguard-tools openresolv wgcf viewnior xsel scrot \
aria2 mpv dmenu polkit htop p7zip \
ripgrep fd xh sd fzf skim choose numlockx \
earlyoom thunar eza micro nnn feh miniserve
## ttyper: Terminal-based typing test
## joshuto-bin (via yay) user friendly! TUI file explorer.
## micro: nano++
## jq jless (for json), uv (for python-pip and venv alternative)
## fend (calc) [from yay/github]
## herbe (minimal popup notification) [from github]
## code-oss (vscode opensource build) with exts -> ruff + python + cody (free ver)
## android-tools gvfs gvfs-mtp (android device support)
## woeusb: create windows usb
## usbimager: create linux usb