#!/usr/bin/bash
## Set manual ip address, resets on reboot.
# USAGE:
#      sudo ./setIP.sh eth0 192.168.0.110 192.168.0.1
#
ip link set $1 up
ip address flush dev $1
ip route flush dev $1
ip address add $2/24 brd + dev $1
ip route add $3 dev $1
ip route add default via $3 dev $1

## in case did not work, try...then try again.
#sudo ip link set enp2s0 down
#sudo ip link set enp2s0 up
