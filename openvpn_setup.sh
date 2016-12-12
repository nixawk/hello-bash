#!/bin/bash

# https://www.digitalocean.com/community/tutorials/how-to-set-up-an-openvpn-server-on-debian-8

# Author: Nixawk
# Tested on:
#     - Debian GNU/Linux 8
#     - Kali Linux

OPENVPN_SERVER=$(ip route get 8.8.8.8 | awk 'NR==1 {print $NF}') # Your server ip
OPENVPN_DNSSERVER1='208.67.222.222' # dns server, /etc/openvpn/server.conf
OPENVPN_DNSSERVER2='208.67.220.220' # dns server, /etc/openvpn/server.conf

echo "[*] Step 1 - Install OpenVPN...."
apt-get -y update > /dev/null
# apt-get -y upgrade > /dev/null
apt-get -y install openvpn easy-rsa > /dev/null

echo "[*] Step 2 - Configure OpenVPN..."
gunzip -c /usr/share/doc/openvpn/examples/sample-config-files/server.conf.gz > /etc/openvpn/server.conf

sed -i 's/dh dh1024.pem/dh dh2048.pem/' /etc/openvpn/server.conf
sed -i 's/;push "redirect-gateway def1 bypass-dhcp"/push "redirect-gateway def1 bypass-dhcp"/' /etc/openvpn/server.conf
sed -i "s/;push \"dhcp-option DNS 208.67.222.222\"/push \"dhcp-option DNS $OPENVPN_DNSSERVER1\"/" /etc/openvpn/server.conf
sed -i "s/;push \"dhcp-option DNS 208.67.220.220\"/push \"dhcp-option DNS $OPENVPN_DNSSERVER2\"/" /etc/openvpn/server.conf
sed -i 's/;user nobody/user nobody/' /etc/openvpn/server.conf
sed -i 's/;group nogroup/group nogroup/' /etc/openvpn/server.conf

echo "[*] Step 3 - Enable Packet Forwarding..."
echo 1 > /proc/sys/net/ipv4/ip_forward
sed -i 's/#net.ipv4.ip_forward=1/net.ipv4.ip_forward=1/' /etc/sysctl.conf

echo "[*] Step 4 - Install and Configure ufw..."
# Please adjust firewall rules yourself.
# apt-get -y install ufw
# ufw allow ssh
# ufw allow 1194/udp
# sed -i 's/DEFAULT_FORWARD_POLICY="DROP"/DEFAULT_FORWARD_POLICY="ACCEPT"/' /etc/default/ufw
# ufw enable

echo "[*] Step 5 - Configure and Build the Certificate Authority..."
cp -r /usr/share/easy-rsa/ /etc/openvpn
mkdir /etc/openvpn/easy-rsa/keys
# sed -i 's/export KEY_COUNTRY="US"//' /etc/openvpn/easy-rsa/vars
# sed -i 's/export KEY_PROVINCE="CA"//' /etc/openvpn/easy-rsa/vars
# sed -i 's/export KEY_CITY="SanFrancisco"//' /etc/openvpn/easy-rsa/vars
# sed -i 's/export KEY_ORG="Fort-Funston"//' /etc/openvpn/easy-rsa/vars
sed -i 's/export KEY_EMAIL="me@myhost.mydomain"/export KEY_EMAIL="someone@demo.com"/' /etc/openvpn/easy-rsa/vars
sed -i 's/export KEY_OU="MyOrganizationalUnit"/export KEY_OU="IT"/' /etc/openvpn/easy-rsa/vars
sed -i 's/export KEY_NAME="EasyRSA"/export KEY_NAME="server"/' /etc/openvpn/easy-rsa/vars

openssl dhparam -out /etc/openvpn/dh2048.pem 2048
cd /etc/openvpn/easy-rsa && . ./vars

./clean-all

# Build CA using an OpenSSL command. This command will prompt you for a confirmation of "Distinguished Name" variables.
./build-ca

echo "[*] Step 6 - Generate a Certificate and Key for the Server..."
./build-key-server server

echo "[*] Step 7 - Move the Server Certificates and Keys..."
cp /etc/openvpn/easy-rsa/keys/{server.crt,server.key,ca.crt} /etc/openvpn

systemctl start openvpn@server.service
systemctl status openvpn@server.service

# openvpn clients: no internet access after a connection
iptables -t nat -A POSTROUTING -s 10.8.0.0/16 -o eth0 -j SNAT --to "$OPENVPN_SERVER"


echo "[*] Step 8 - Generate Certificates and Keys for Clients..."
cd /etc/openvpn/easy-rsa

cp /usr/share/doc/openvpn/examples/sample-config-files/client.conf /etc/openvpn/easy-rsa/keys/client.ovpn
sed -i "s/remote my-server-1 1194/remote $OPENVPN_SERVER 1194/" /etc/openvpn/easy-rsa/keys/client.ovpn
sed -i 's/;user nobody/user nobody/' /etc/openvpn/easy-rsa/keys/client.ovpn
sed -i 's/;group nogroup/group nogroup/' /etc/openvpn/easy-rsa/keys/client.ovpn
./build-key client1

sed -i 's/ca ca.crt/# ca ca.crt/' /etc/openvpn/easy-rsa/keys/client.ovpn
sed -i 's/cert client.crt/# cert client.crt/' /etc/openvpn/easy-rsa/keys/client.ovpn
sed -i 's/key client.key/# key client.key/'/etc/openvpn/easy-rsa/keys/client.ovpn

echo "[*] Step 9 - Creating a Unified OpenVPN Profile for Client Devices..."
echo '<ca>' >> /etc/openvpn/easy-rsa/keys/client.ovpn
cat /etc/openvpn/ca.crt >> /etc/openvpn/easy-rsa/keys/client.ovpn
echo '</ca>' >> /etc/openvpn/easy-rsa/keys/client.ovpn

echo '<cert>' >> /etc/openvpn/easy-rsa/keys/client.ovpn
cat /etc/openvpn/easy-rsa/keys/client1.crt >> /etc/openvpn/easy-rsa/keys/client.ovpn
echo '</cert>' >> /etc/openvpn/easy-rsa/keys/client.ovpn

echo '<key>' >> /etc/openvpn/easy-rsa/keys/client.ovpn
cat /etc/openvpn/easy-rsa/keys/client1.key >> /etc/openvpn/easy-rsa/keys/client.ovpn
echo '</key>' >> /etc/openvpn/easy-rsa/keys/client.ovpn

echo "[*] Step 10 - How to connect openvpn ?"
echo "Liinx  : openvpn --config /etc/openvpn/easy-rsa/keys/client.ovpn"
echo "Mac OSX: Tunnelblick"
