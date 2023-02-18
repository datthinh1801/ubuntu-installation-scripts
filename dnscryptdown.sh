#! /bin/sh

sudo chattr -i /etc/resolv.conf
sudo nmcli general reload
