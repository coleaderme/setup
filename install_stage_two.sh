#!/usr/bin/sh
# sh install_stage_two.sh

# RUN in arch-chroot /mnt
# ==========================================================="
# * mount partition with ~100MB size *
# > mkdir /boot/efi
# > mount /dev/sdX1 /boot/efi
# ==========================================================="

# mount /boot/efi
echo "[Choose] /boot partition ~100MB"
sleep 1
echo "wait 3 seconds for prompt.."
sleep 3
d=$(lsblk -l | fzf | cut -c 1-4)
echo "Selected: /dev/$d"
mkdir /boot/efi
mount /dev/$d /boot/efi

# user setup
ln -sf /usr/share/zoneinfo/Asia/Kolkata /etc/localtime
ln -sf /usr/bin/dash /usr/bin/sh
echo "[+] Adding user 'dra' "
useradd -m dra
echo "[*] Enter passwd for 'dra'"
passwd dra
usermod -aG wheel,storage,power dra
sd -s '# %wheel ALL=(ALL:ALL) ALL' '%wheel ALL=(ALL:ALL) ALL' /etc/sudoers
sd -s '# %wheel ALL=(ALL:ALL) NOPASSWD: ALL' '%wheel ALL=(ALL:ALL) NOPASSWD: ALL' /etc/sudoers

# locale
echo "en_US.UTF-8" >> /etc/locale.gen
locale-gen
echo LANG=en_US.UTF-8 > /etc/locale.conf
export LANG=en_US.UTF-8
echo arch > /etc/hostname
mv etc/hosts /etc/hosts
mv etc/sysctl.conf /etc/sysctl.conf

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
