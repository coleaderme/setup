#!/usr/bin/bash
locale-gen
echo LANG=en_US.UTF-8 > /etc/locale.conf
export LANG=en_US.UTF-8
echo arch > /etc/hostname
mv hosts /etc/hosts
