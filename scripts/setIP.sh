#!/usr/bin/sh
if [[ $1 == '' ]]
then
    echo -e "USAGE:\n ./setIP.sh eth0 192.168.0.110 192.168.0.1\n\n(resets on reboot)"
    exit
fi
ip link set $1 up
ip address flush dev $1
ip route flush dev $1
ip address add $2/24 brd + dev $1
ip route add $3 dev $1
ip route add default via $3 dev $1