#!/bin/bash

echo "[:] assuming I properly mounted / /home & swap"
echo "[:] this is for INTEL CPU."

timedatectl set-timezone Asia/Kolkata
cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.bak
echo "[+] Downloading.. base packages"
pacstrap -i /mnt base base-devel linux linux-headers linux-firmware intel-ucode git nano dhcpcd pulseaudio
echo "[OK]"
echo "[+] Generating fstab"
genfstab -U /mnt >> /mnt/etc/fstab
echo "[+] chrooted to /mnt"
arch-chroot /mnt
echo "-----------------------------------------------------------------------"
ln -sf /usr/share/zoneinfo/Asia/Kolkata /etc/localtime
echo "[+] adding user 'dra' without passwd"
useradd -m dra && usermod -aG wheel,storage,power dra
echo "uncomment wheel allow group wheel something-line"
sleep 4
EDITOR=nano visudo
echo "uncomment en_US.UTF-8"
sleep 3
nano /etc/locale.gen
locale-gen
echo LANG=en_US.UTF-8 > /etc/locale.conf
export LANG=en_US.UTF-8
echo arch > /etc/hostname
mv hosts /etc/hosts
pacman -S grub efibootmgr dosfstools mtools
grub-install --target=x86_64-efi --bootloader-id=grub_efi --recheck
grub-mkconfig -o /boot/grub/grub.cfg
systemctl enable dhcpcd.service
echo "alt+prntscreen+e to terminate hanged program"
echo "1" > /proc/sys/kernel/sysrq

echo "type: exit"
echo "type: umount -lR /mnt"
echo "now reboot"