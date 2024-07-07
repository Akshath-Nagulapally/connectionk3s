#!/bin/bash

pkg update && pkg upgrade
pkg install wget qemu-system-x86-64-headless qemu-utils

mkdir virtual_machine
cd virtual_machine/

#get the iso file
wget <link-to-iso-file>

qemu-img create -f qcow2 alpine.qcow2 10G

#put try all the ports and assign to them logic here.
qemu-system-x86_64 -m 512 \
-netdev user,id=n1,hostfwd=tcp::1234-:22,hostfwd=tcp::6443-:6443,hostfwd=tcp::8080-:80,hostfwd=tcp::8443-:443 \
-device virtio-net,netdev=n1 \
-nographic \
-drive file=debian-12-nocloud-arm64.qcow2,format=qcow2




