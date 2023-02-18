#! /bin/sh

sudo chattr -i /etc/resolv.conf

sudo tee /etc/resolv.conf > /dev/null <<EOF
nameserver 127.0.2.1
options edns0
EOF

sudo chattr +i /etc/resolv.conf
sudo nmcli general reload
