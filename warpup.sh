#! /bin/sh

sudo chattr -i /etc/resolv.conf
warp-cli connect
