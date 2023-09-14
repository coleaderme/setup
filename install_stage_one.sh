#!/usr/bin/bash
#
# [!] FOR INTEL CPU only!
# for AMD CPU replace 'intel-ucode' with 'amd-ucode' in 'pacstrap' command
#
# [*] Assuming properly mounted '/' & '/home' (SWAP is not recommended)"
# This should work flawlessly.
#
echo "[+] Setting timezone"
timedatectl set-timezone Asia/Kolkata
cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.bak
alias rank="rankmirrors -n 5 /etc/pacman.d/mirrorlist.bak >> /etc/pacman.d/mirrorlist"
echo "[*] If download is slow, type: rank"
echo ''
echo "[+] Moving configs to /etc/"
mv etc/nanorc /etc/
mv etc/resolv.conf /etc/
mv etc/bash.bashrc /etc/
echo "set completion-ignore-case on" >> /etc/inputrc
echo "set enable-keypad on" >> /etc/inputrc

echo "[+] Downloading.. base packages"
pacstrap -i /mnt base base-devel linux-lts linux-lts-headers linux-firmware intel-ucode git nano dhcpcd
echo "[OK]"
echo "[+] Generating fstab"
genfstab -U /mnt >> /mnt/etc/fstab
echo ''
echo "======================================================="
echo "[+] yo! arch-chroot now."
echo "[>] arch-chroot /mnt"
echo ''
echo "[+] Now we're heading towards stage_two, may need to git clone again."
echo "[!] MUST READ 'install_stage_two.sh' before running it!"
echo "======================================================="