#!/bin/bash
pacman -S grub efibootmgr dosfstools mtools
grub-install --target=x86_64-efi --bootloader-id=grub_efi --recheck
grub-mkconfig -o /boot/grub/grub.cfg
systemctl enable dhcpcd.service
exit
umount -lR /mnt
echo "Everything Done, you can safely reboot now."
