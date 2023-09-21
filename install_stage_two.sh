#!/usr/bin/sh
#
# RUN in arch-chroot
#
# Before running this..
# ==========================================================="
# * mount partition with ~100MB size *
# > mkdir /boot/efi
# > mount /dev/sdX1 /boot/efi
# ==========================================================="
# After doing steps above, you may run 'install_stage_two.sh'.
#

# user setup
ln -sf /usr/share/zoneinfo/Asia/Kolkata /etc/localtime
ln -sf /usr/bin/dash /usr/bin/sh
echo "[+] Adding user 'dra' "
useradd -m dra
echo "[*] Enter passwd for 'dra'"
passwd dra
usermod -aG wheel,storage,power dra
echo "Uncomment...wait 5 seconds to open."
echo "========================="
echo "%wheel ALL=(ALL:ALL) ALL"
echo "========================="
echo "this line ^^ somewhere at end of the file."
sleep 5
EDITOR=nano visudo

# locale
echo "en_US.UTF-8" /etc/locale.gen
locale-gen
echo LANG=en_US.UTF-8 > /etc/locale.conf
export LANG=en_US.UTF-8
echo arch > /etc/hostname
mv etc/hosts /etc/hosts

# grub setup
pacman -S grub efibootmgr dosfstools mtools
grub-install --target=x86_64-efi --bootloader-id=grub_efi --recheck
grub-mkconfig -o /boot/grub/grub.cfg

# misc.
systemctl enable dhcpcd.service

# exit
echo "======================================================="
echo "Base installation is done!"
echo "types these commands and eject USB"
echo "> exit"
echo "> umount -lR /mnt"
echo "> reboot"
echo "======================================================="