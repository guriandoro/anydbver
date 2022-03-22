#!/bin/bash
DEV=$(/sbin/ip ro ls | grep default | cut -d' ' -f 5)
if [ "x$DEV" == "x" ] ; then
  echo "127.0.0.1"
  exit 1
fi
# virtualbox with single ip nat has default ip 10.0.2.15
if /sbin/ip -o -4 addr list eth0 2>/dev/null|grep -F 10.0.2.15/24 &>/dev/null ; then DEV=eth1 ; fi
ip4=$(/sbin/ip -o -4 addr list $DEV | awk '{print $4}' | cut -d/ -f1)
echo -n $ip4
