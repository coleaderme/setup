#!/usr/bin/bash
# Script [1/3]
# bash base_install.sh

# ==========================================================="
# * mount partition with ~100MB size *
# > mkdir /boot/efi
# > mount /dev/sdX1 /boot/efi
# ==========================================================="
# Run this script in 'arch-chroot /mnt'
# ==========================================================="

## Ready to install?
read -p "Ready to install? (Y/N): " confirm && [[ $confirm == [yY] ]] || exit 1
read -p "Did you mount /boot/efi to ~100MB partition? (Y/N): " confirm && [[ $confirm == [yY] ]] || exit 1
## Add new user
read -p "Enter user: " new_user
echo "$new_user"
## root passwd
echo "[+] Enter passwd for root: "
passwd
## user setup
echo "[+] Adding new_user: "
useradd -m "$new_user"
echo "[*] Enter passwd for new_user: "
passwd "$new_user"
usermod -aG wheel,storage,power "$new_user"
sd -s '# %wheel ALL=(ALL:ALL) ALL' '%wheel ALL=(ALL:ALL) ALL' /etc/sudoers
sd -s '# %wheel ALL=(ALL:ALL) NOPASSWD: ALL' '%wheel ALL=(ALL:ALL) NOPASSWD: ALL' /etc/sudoers
ln -sf /usr/share/zoneinfo/Asia/Kolkata /etc/localtime

## locale
timedatectl set-timezone Asia/Kolkata
sd -s '#en_US.UTF-8 UTF-8' 'en_US.UTF-8 UTF-8' /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" > /etc/locale.conf
export LANG=en_US.UTF-8
echo arch > /etc/hostname
echo "127.0.0.1 localhost" >> /etc/hosts
echo "::1 localhost" >> /etc/hosts
echo "127.0.1.1 arch.localdomain localhost" >> /etc/hosts
## etc confs
mv etc/nanorc /etc/
mv etc/resolv.conf /etc/
mv etc/bash.bashrc /etc/
echo "set completion-ignore-case on" >> /etc/inputrc
echo "set enable-keypad on" >> /etc/inputrc

## grub bootloader setup
echo "[+] Setting up grub bootloader"
pacman -S --needed --noconfirm grub efibootmgr dosfstools mtools
grub-install --target=x86_64-efi --bootloader-id=grub_efi --recheck
grub-mkconfig -o /boot/grub/grub.cfg
echo "done."

## exit
echo "======================================================="
echo "Base installation is done!"
echo "types these commands and eject USB"
echo "> exit"
echo "> umount -lR /mnt"
echo "> reboot"
echo "======================================================="
echo '[*] To get permissions for setup files, after reboot, copy /setup to ~/setup;'
echo '[>] sudo chown -R $USER setup/'
echo "======================================================="
