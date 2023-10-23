#!/usr/bin/sh
# sh install_stage_two.sh

# [!] FOR INTEL CPU only!
# for AMD CPU replace 'intel-ucode' with 'amd-ucode' in 'pacstrap' command
#
a=$(ls already_ran_reflector*)
[ -z $a ] && sh essential.sh || echo "Already ran reflector"

###############################
echo "carefully make a note of / and /home partitions"
sleep 1
lsblk
sleep 1
echo "waiting 5s.. "
sleep 5

# mount / and /home
echo "[Choose] / (root) partition "
sleep 1
echo "wait 3 seconds for prompt.."
sleep 3
r=$(lsblk -l | fzf | cut -c 1-4)
echo "Selected: /dev/$d"
mount /dev/$r /mnt

## /home 
echo "[Choose] /home partition "
sleep 1
echo "wait 3 seconds for prompt.."
sleep 3
h=$(lsblk -l | fzf | cut -c 1-4)
echo "Selected: /dev/$h"
mkdir /mnt/home
mount /dev/$h /mnt/home
###############################
timedatectl set-timezone Asia/Kolkata
mv etc/nanorc /etc/
mv etc/resolv.conf /etc/
mv etc/bash.bashrc /etc/
echo "set completion-ignore-case on" >> /etc/inputrc
echo "set enable-keypad on" >> /etc/inputrc
pacstrap -i /mnt base base-devel linux-lts linux-lts-headers linux-firmware intel-ucode git nano dhcpcd dash sd
genfstab -U /mnt >> /mnt/etc/fstab
echo "======================================================="
echo "[>] arch-chroot /mnt"
echo ''
echo "[+] Now we're heading towards stage_two, may need to git clone again."
echo "[!] MUST READ 'install_stage_two.sh' before running it!"
echo "======================================================="