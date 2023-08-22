#!/usr/bin/bash

## Set manual ip address, resets on reboot.
## usage:
#       ./setIP.sh eth0 192.168.0.110 192.168.0.1

## Clear current settings
#ip address flush dev $device
#ip route flush dev $device

ip address add $2/24 brd + dev $1
ip route add $3 dev $1
ip route add default via $3 dev $1