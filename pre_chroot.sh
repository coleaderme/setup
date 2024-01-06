#!/usr/bin/sh
# sh pre_chroot.sh

# [!] FOR INTEL CPU!
# [!] AMD CPU replace 'intel-ucode' with 'amd-ucode' in 'pacstrap -i /mnt ..' command
#
### Install essentials.sh
a=$(ls already_ran_reflector*)
# if empty run essential.sh
[ -z $a ] && sh essential.sh || echo "Already ran reflector"

### PACSTRAP
pacstrap -i /mnt base base-devel linux-lts linux-lts-headers linux-firmware intel-ucode git nano dhcpcd dash sd
genfstab -U /mnt >> /mnt/etc/fstab

echo "[>] arch-chroot /mnt"
echo "[!] MUST READ 'base_install.sh' before running!"