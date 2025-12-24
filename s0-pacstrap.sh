#!/usr/bin/sh
#
# Intel cpu: intel-ucode (optionals: libva-intel-driver xf86-video-intel vulkan-intel)
# AMD   cpu: amd-ucode
#
pacstrap -K /mnt base base-devel sudo linux-lts linux-lts-headers linux-firmware fzf nano dhcpcd git intel-ucode
genfstab -U /mnt >> /mnt/etc/fstab
