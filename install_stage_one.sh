#!/usr/bin/bash
#
# this is for INTEL CPU
# assuming I properly mounted '/' & '/home' (swap is optional)"
# this should work flawlessly.
#
echo "STAGE ONE++++++++++++++++++++++++++++++++++++++++++++++"
echo ""
echo "[+] setting timezone"
timedatectl set-timezone Asia/Kolkata
cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.bak
echo "[try] If download is slow, run this command."
echo "> rankmirros -n 5 /etc/pacman.d/mirrorlist.bak >> /etc/pacman.d/mirrorlist"
echo "[+] put configs in /etc .."
mv nanorc /etc/
mv resolv.conf /etc/
mv bash.bashrc /etc/
echo "[+] Downloading.. base packages"
pacstrap -i /mnt base base-devel linux linux-headers linux-firmware intel-ucode git nano dhcpcd
echo "[OK]"
echo "[+] Generating fstab"
genfstab -U /mnt >> /mnt/etc/fstab

echo "======================================================="
echo "arch-chroot now."
echo "[type:] arch-chroot /mnt"
echo "Run STAGE TWO"
echo "======================================================="
echo ""
echo "+++++++++++++++++++++++++++++++++++++++END of STAGE ONE"