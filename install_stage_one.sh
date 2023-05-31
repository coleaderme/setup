#!/bin/bash

echo "[:] assuming I properly mounted / /home & swap"
echo "[:] this is for INTEL CPU."
echo "---------------------------------STAGE ONE------------------------------------"
echo ""
timedatectl set-timezone Asia/Kolkata
cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.bak
mv pacman.conf /etc/
mv nanorc /etc/
mv resolv.conf /etc/
echo "[+] Downloading.. base packages"
pacstrap -i /mnt base base-devel linux linux-headers linux-firmware intel-ucode git nano dhcpcd
echo "[OK]"
echo "[+] Generating fstab"
genfstab -U /mnt >> /mnt/etc/fstab
echo "[type:] arch-chroot /mnt"
echo "Run STAGE TWO"
echo ""
echo "-----------------------------END of STAGE ONE------------------------------------"