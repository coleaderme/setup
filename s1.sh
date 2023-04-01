#!/bin/bash
timedatectl set-timezone Asia/Kolkata
echo "[+] Downloading.. base packages"
pacstrap -i /mnt base base-devel linux linux-headers linux-firmware intel-ucode git nano dhcpcd pulseaudio
echo "[OK]"
echo "[+] Generating fstab"
genfstab -U /mnt >> /mnt/etc/fstab
echo "[+] chrooted to /mnt"
arch-chroot /mnt
echo "-----------------------------------------------------------------------"
echo "1. setup root :passwd:"
echo "> add passwd for local user :passwd dra:"
useradd -m dra
