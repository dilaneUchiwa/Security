#!/bin/sh

iptables -F
iptables -X

iptables -P INPUT ACCEPT
iptables -P FORWARD ACCEPT
iptables -P OUTPUT ACCEPT

systemctl stop fail2ban
systemctl disable fail2ban

systemctl stop firewall.service
systemctl disable firewall.service

echo "Tous les services de sécurité sont arrêtés et les règles de pare-feu sont supprimées."
