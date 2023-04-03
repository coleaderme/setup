#!/bin/bash
pacman -S grub efibootmgr dosfstools mtools
grub-install --target=x86_64-efi --bootloader-id=grub_efi --recheck
grub-mkconfig -o /boot/grub/grub.cfg
systemctl enable dhcpcd.service
echo "type: exit"
echo "type: umount -lR /mnt"
