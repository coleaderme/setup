#!/usr/bin/sh
# ./setMac.sh eth_dev XX:XX:XX:XX:XX
[ -z $1 ] && echo "USAGE:\n ./setMac.sh eth0 XX:XX:XX:XX:XX\n\n(resets on reboot)" && exit
sudo ip link set $1 down
sudo macchanger --mac=$2 $1
sudo ip link set $1 up
