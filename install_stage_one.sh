#!/usr/bin/bash
#
# FOR INTEL CPU
# Assuming properly mounted '/' & '/home' (swap is optional)"
# This should work flawlessly.
#
echo "[+] Setting timezone"
timedatectl set-timezone Asia/Kolkata
cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.bak
alias rank="rankmirrors -n 5 /etc/pacman.d/mirrorlist.bak >> /etc/pacman.d/mirrorlist"

echo "[!] If download is slow, type: rank"
echo "OR"
echo "rankmirrors -n 5 /etc/pacman.d/mirrorlist.bak >> /etc/pacman.d/mirrorlist"

echo "[+] Moving configs to /etc/ ..."
mv nanorc /etc/
mv resolv.conf /etc/
mv bash.bashrc /etc/
echo 'set completion-ignore-case On' >> /etc/inputrc
echo "[+] Downloading.. base packages"
pacstrap -i /mnt base base-devel linux linux-headers linux-firmware intel-ucode git nano dhcpcd
echo "[OK]"
echo "[+] Generating fstab"
genfstab -U /mnt >> /mnt/etc/fstab

echo "======================================================="
echo "yo! arch-chroot now."
echo "> arch-chroot /mnt"
echo ''
echo " Now we're on stage_two, may need to git clone again."
echo " READ BEFORE running next bash script!"
echo "======================================================="
