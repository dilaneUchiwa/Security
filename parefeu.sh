#!/bin/sh

iptables -F
iptables -X

# Autoriser SSH sur le port 43951
iptables -A INPUT -p tcp --dport 43951 -m limit --limit 5/min -j ACCEPT
iptables -A OUTPUT -p tcp --dport 43951 -j ACCEPT

# Autoriser les connexions établies
iptables -A INPUT -m conntrack --ctstate ESTABLISHED -j ACCEPT
iptables -A OUTPUT -m conntrack --ctstate ESTABLISHED -j ACCEPT

# Autoriser le loopback (localhost)
iptables -I INPUT 2 -i lo -j ACCEPT


# Autoriser le trafic HTTP/HTTPS
iptables -A INPUT -p tcp --dport 80 -j ACCEPT
iptables -A INPUT -p tcp --dport 443 -j ACCEPT
iptables -A OUTPUT -p tcp --dport 80 -j ACCEPT
iptables -A OUTPUT -p tcp --dport 443 -j ACCEPT

# Autoriser les pings   
iptables -A INPUT -p icmp -m limit --limit 1/s --limit-burst 3 -j ACCEPT
iptables -A OUTPUT -p icmp -m conntrack --ctstate NEW,ESTABLISHED,RELATED -j ACCEPT


# Autoriser le trafic NTP (synchronisation du temps)
iptables -A OUTPUT -p udp --dport 123 -j ACCEPT

# Loguer les paquets rejetés (pour le débogage)
iptables -A INPUT -j LOG --log-prefix "iptables-reject: "

# Définir les politiques par défaut pour bloquer tout
iptables -P INPUT DROP
iptables -P FORWARD DROP
iptables -P OUTPUT DROP
