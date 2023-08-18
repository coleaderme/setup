#!/usr/bin/bash
git clone https://github.com/coleaderme/dwm.git && cd dwm
makepkg -si
echo "[+] update: 'exec dwm' to your xinitrc"
