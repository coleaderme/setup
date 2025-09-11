#!/usr/bin/sh
# sudo bash base_install.sh [root]

# ==========================================================="
# * mount partition with ~100MB size *
# > mkdir /boot/efi
# > mount /dev/sdX1 /boot/efi
# ==========================================================="
# Run this script in 'arch-chroot /mnt'
# ==========================================================="

## Ready to install?
printf 'Ready to install? (Y/N): '; read -r confirm || exit; case $confirm in [yY]) ;; *) exit ;; esac
printf 'Did you mount /boot/efi to ~100MB partition? (Y/N): '; read -r confirm || exit; case $confirm in [yY]) ;; *) exit ;; esac

## root passwd
echo '[+] Enter passwd for root: '
passwd
## Add new user
printf 'Enter user: '; read -r new_user
echo "$new_user"
## user setup
printf '[+] Adding new_user: '
useradd -m "$new_user"
printf '[*] Enter passwd for new_user: '
passwd "$new_user"
usermod -aG wheel,storage,power "$new_user"
sed -i 's/# %wheel ALL=(ALL:ALL) ALL/%wheel ALL=(ALL:ALL) ALL/' /etc/sudoers
sed -i 's/# %wheel ALL=(ALL:ALL) NOPASSWD: ALL/%wheel ALL=(ALL:ALL) NOPASSWD: ALL/' /etc/sudoers
ln -sf /usr/share/zoneinfo/Asia/Kolkata /etc/localtime

## locale
sed -i 's/#en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen
export LANG=en_US.UTF-8
echo 'LANG=en_US.UTF-8' > /etc/locale.conf
locale-gen
echo arch > /etc/hostname
echo '127.0.0.1 localhost' >> /etc/hosts
echo '::1 localhost' >> /etc/hosts
echo '127.0.1.1 arch.localdomain localhost' >> /etc/hosts
echo 'nameserver 127.0.0.1' > /etc/resolv.conf # if using localdns, else set 8.8.8.8
## etc confs
cp etc/nanorc /etc/
cp etc/makepkg.conf /etc/
# cp etc/asound.conf /etc/ # copy if using alsa eq
cp etc/dnscrypt-proxy.toml /etc/dnscrypt-proxy/
cp etc/bash.bashrc /etc/
echo 'set completion-ignore-case on' >> /etc/inputrc
echo 'set enable-keypad on' >> /etc/inputrc
## Allow udisks2 to mount devices without authentication
mkdir -p '/etc/polkit-1/rules.d' && cp etc/10-udisks2.rules /etc/polkit-1/rules.d/ 


## grub bootloader setup
echo '[+] Setting up grub bootloader'
pacman -S --needed --noconfirm grub efibootmgr dosfstools mtools
grub-install --target=x86_64-efi --bootloader-id=archbtw --recheck
grub-mkconfig -o /boot/grub/grub.cfg
echo 'done.'

## exit
echo '======================================================='
echo 'Base installation is done!'
echo 'types these commands and eject USB'
echo '> exit'
echo '> umount -lR /mnt'
echo '> reboot'
echo '======================================================='
echo '[*] To get permissions for setup files, after reboot, copy /setup to ~/setup;'
echo '[>] sudo chown -R $USER setup/' # single qoutes, so it doesnt expand $
echo '======================================================='
