sudo -s
apt update
apt install -y dnscrypt-proxy

cd /etc/dnscrypt-proxy
cat << EOF
# Empty listen_addresses to use systemd socket activation
listen_addresses = ['127.0.2.1:53']
server_names = ['datthinh1801']

[static]
  [static.'datthinh1801']
  stamp = 'sdns://AgcAAAAAAAAAAAAcZGF0dGhpbmgxODAxLWdjcC5kdWNrZG5zLm9yZwovZG5zLXF1ZXJ5'
EOF > dnscrypt-proxy.toml

systemctl stop systemd-resolved
systemctl disable systemd-resolved

systemctl stop dnscrypt-proxy
systemctl stop dnscrypt-proxy.socket

cp /etc/resolv.conf /etc/resolv.conf.backup
cat << EOF
nameserver 127.0.2.1
options edns0
EOF > /etc/resolv.conf

./dnscrypt-proxy -service install
./dnscrypt-proxy -service start

vim /etc/NetworkManager/NetworkManager.conf
# add the dns=none under [main]

# edit the privileged crontab to properly start dnscrypt-proxy service
sudo crontab -e
# @reboot systemctl stop dnscrypt-proxy.socket && systemctl restart dnscrypt-proxy