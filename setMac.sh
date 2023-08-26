#!/usr/bin/bash
if [[ $1 == '' ]]
then
    echo -e "USAGE:\n ./setMac.sh eth0 XX:XX:XX:XX:XX\n\n(resets on reboot)"
    exit
fi
sudo ip link set $1 down
sudo macchanger --mac=$2 $1
sudo ip link set $1 up
