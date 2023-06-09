#!/usr/bin/bash
#
# RUN in arch-chroot
#
# Before running this..
# ==========================================================="
# * mount partition with ~100MB size *
# > mkdir /boot/efi
# > mount /dev/sdX1 /boot/efi
# ==========================================================="


ln -sf /usr/share/zoneinfo/Asia/Kolkata /etc/localtime
echo "[+!+] adding user 'dra' "
useradd -m dra
echo "[-!-] Enter passwd for USER"
passwd dra
usermod -aG wheel,storage,power dra
echo "Uncomment wheel allow group wheel something-line...wait 4 seconds"
sleep 4
EDITOR=nano visudo

# locale
echo "en_US.UTF-8" /etc/locale.gen
locale-gen
echo LANG=en_US.UTF-8 > /etc/locale.conf
export LANG=en_US.UTF-8
echo arch > /etc/hostname
mv hosts /etc/hosts

# grub setup
pacman -S grub efibootmgr dosfstools mtools
grub-install --target=x86_64-efi --bootloader-id=grub_efi --recheck
grub-mkconfig -o /boot/grub/grub.cfg

# misc.
systemctl enable dhcpcd.service

# exit
echo "======================================================="
echo "> exit"
echo "> umount -lR /mnt"
echo "> reboot"
echo "======================================================="