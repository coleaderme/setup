#!/usr/bin/sh
#
# requirements for fully functional env.
# Slow download speed fix.
#
echo "================================"
echo "+++Installing essential tools+++"
echo "================================"
pacman -Syy
pacman -S --needed --noconfirm pacman-contrib reflector rsync sd fzf dnscrypt-proxy
systemctl disable dnscrypt-proxy.socket
systemctl enable dnscrypt-proxy.service
reflector --threads 5 --sort rate --country AU,GB,IN --age 12 --download-timeout 60 --fastest 20 --protocol https --ipv4 --save /etc/pacman.d/mirrorlist
echo 1 >> already_ran_reflector.txt