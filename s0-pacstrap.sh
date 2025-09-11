#!/usr/bin/sh
#
# Intel cpu: intel-ucode (optionals: xf86-video-intel vulkan-intel)
# AMD   cpu: amd-ucode
#
pacstrap -K /mnt base base-devel sudo linux-lts linux-lts-headers linux-firmware fzf nano git intel-ucode
genfstab -U /mnt > /mnt/etc/fstab
