#!/usr/bin/sh
# sh s2-packages.sh [ROOT]
#

pacman -Syy
pacman -S --needed --noconfirm xorg-server xorg-xinit xorg-xset ntfs-3g \
ttf-arphic-ukai ttf-indic-otf ttf-ubuntu-font-family ttc-iosevka-ss04 noto-fonts-emoji \
alsa-utils wireguard-tools openssh openresolv wgcf viewnior xsel scrot \
aria2 mpv cmus polkit gnome-keyring htop 7zip \
ripgrep fd xh fzf skim choose clipmenu numlockx \
earlyoom thunar eza micro nnn feh miniserve \
android-tools qrencode dust dnscrypt-proxy rclone fuse3
## ttyper: Terminal-based typing test
## mtr: ping hops traceroute
## copyparty: filesharing
## cmus: simple music player that reads replaygain (track)
## fclones: find duplicates
## joshuto-bin (via yay) user friendly! TUI file explorer.
## micro: nano++
## jq jless: (for json)
## uv: (for python-pip and venv alternative)
## fend (calc) [from yay/github]
## herbe (minimal popup notification) [from github]
## code-oss (vscode opensource build) with exts -> ruff + python + cody (free ver)
## gvfs gvfs-mtp: (auto mount various devices)
## woeusb: create windows usb
## usbimager: create linux usb
## gitui: tui for git
## glow: tui markdown (.md) viewer
