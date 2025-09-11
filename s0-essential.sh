#!/usr/bin/sh
#
# requirements for fully functional env.
# Slow download speed fix.
#
echo "================================"
echo "+++Installing essential tools+++"
echo "================================"
pacman -Syy
pacman -S --needed --noconfirm pacman-contrib reflector rsync fzf dnscrypt-proxy
systemctl disable dnscrypt-proxy.socket
systemctl enable dnscrypt-proxy.service
reflector --threads 4 --sort rate --download-timeout 5 --country IN --age 6 --protocol http --fastest 10 --ipv4 --save /etc/pacman.d/mirrorlist
echo 1 >> already_ran_reflector.txt