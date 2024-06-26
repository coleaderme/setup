#!/usr/bin/bash
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
ln -sf /usr/bin/dash /usr/bin/sh
## locale
timedatectl set-timezone Asia/Kolkata
echo "en_US.UTF-8" >> /etc/locale.gen
locale-gen
echo LANG=en_US.UTF-8 > /etc/locale.conf
export LANG=en_US.UTF-8
echo arch > /etc/hostname
## etc confs
mv etc/hosts /etc/hosts
mv etc/nanorc /etc/
mv etc/resolv.conf /etc/
mv etc/bash.bashrc /etc/
mkdir /etc/systemd
mv etc/oomd.conf /etc/systemd/
echo "set completion-ignore-case on" >> /etc/inputrc
echo "set enable-keypad on" >> /etc/inputrc

## grub setup
pacman -S --needed grub efibootmgr dosfstools mtools
grub-install --target=x86_64-efi --bootloader-id=grub_efi --recheck
grub-mkconfig -o /boot/grub/grub.cfg

## misc.
systemctl enable dhcpcd
systemctl enable systemd-oomd
systemctl start systemd-oomd

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
