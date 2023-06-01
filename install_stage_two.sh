#!/usr/bin/bash
#
# RUN in arch-chroot
#
echo "Started---------------------------------------STAGE TWO"

mkdir /boot/efi
echo "=================================="
echo "[!] mount partition with ~100MB size"
echo "> mount /dev/sdX1 /boot/efi"
echo "=================================="

ln -sf /usr/share/zoneinfo/Asia/Kolkata /etc/localtime
echo "[+!+] adding user 'dra' "
useradd -m dra && usermod -aG wheel,storage,power dra
echo "[-!-] Enter passwd for USER"
passwd dra

echo "Uncomment wheel allow group wheel something-line...wait 4 seconds"
sleep 4
EDITOR=nano visudo

# Locale
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
echo "type: exit"
echo "type: umount -lR /mnt"
echo "type: reboot"
echo "======================================================="
echo "Finished-------------------------------END of STAGE TWO"