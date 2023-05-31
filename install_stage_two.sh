#!/usr/bin/bash
# RUN in arch-chroot #
echo "---------------------------------STAGE TWO------------------------------------"
ln -sf /usr/share/zoneinfo/Asia/Kolkata /etc/localtime
echo "[+] adding user 'dra' without passwd"
useradd -m dra && usermod -aG wheel,storage,power dra
echo "Uncomment wheel allow group wheel something-line...after 4 seconds"
sleep 4
EDITOR=nano visudo
echo "Uncomment en_US.UTF-8 ...after 3 seconds"
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
echo "[alt]+[prntscreen]+[e] to kill program not responding"
echo "1" > /proc/sys/kernel/sysrq

echo "type: exit"
echo "type: umount -lR /mnt"
echo "now reboot"
echo ""
echo "-----------------------------END of STAGE TWO------------------------------------"