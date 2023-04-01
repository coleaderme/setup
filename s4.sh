#!/bin/bash
locale-gen
echo LANG=en_US.UTF-8 > /etc/locale.conf
export LANG=en_US.UTF-8
echo arch > /etc/hostname
echo '.'
echo "mv hosts /etc/hosts; use git"
echo '.'
