#!/bin/sh

# On vide les règles déjà existantes
iptables -F
iptables -X

# # On refuse toutes les connexions
# iptables -t filter -P INPUT DROP
# iptables -t filter -P FORWARD DROP
# iptables -t filter -P OUTPUT DROP

# On autorise les connexions déjà établie

iptables -A INPUT -m conntrack --ctstate ESTABLISHED -j ACCEPT
iptables -A OUTPUT -m conntrack --ctstate ESTABLISHED -j ACCEPT

# iptables -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
# iptables -A OUTPUT -m state --state RELATED,ESTABLISHED -j ACCEPT

# # On autorise le loop-back (localhost)
iptables -I INPUT 2 -i lo -j ACCEPT
# iptables -t filter -A INPUT -i lo -j ACCEPT
# iptables -t filter -A OUTPUT -o lo -j ACCEPT

# # On autorise le ping
# iptables -t filter -A INPUT -p icmp -j ACCEPT
# iptables -t filter -A OUTPUT -p icmp -j ACCEPT

# On autorise le SSH sur le port 43951

iptables -A INPUT -p tcp -i eth0 --dport 43951 -j ACCEPT

# iptables -t filter -A INPUT -p tcp --dport 43951 -j ACCEPT
# iptables -t filter -A OUTPUT -p tcp --dport 43951 -j ACCEPT

# NTP 
# iptables -t filter -A OUTPUT -p udp --dport 123 -j ACCEPT

# WEB ( HTTP  , HTTPS )

iptables -A INPUT -p tcp -i eth0 --dport 80 -j ACCEPT
iptables -A INPUT -p tcp -i eth0 --dport 443 -j ACCEPT

iptables -t filter -A OUTPUT -p tcp --dport 80 -j ACCEPT
iptables -t filter -A OUTPUT -p tcp --dport 443 -j ACCEPT
iptables -t filter -A INPUT -p tcp --dport 80 -j ACCEPT
iptables -t filter -A INPUT -p tcp --dport 443 -j  ACCEPT 

# On autorise le PC a faire des pings sur des IP externes et à répondre aux requêtes "ping"
iptables -A OUTPUT -p icmp -m conntrack --ctstate NEW,ESTABLISHED,RELATED -j ACCEPT

# On autorise les pings 
iptables -A INPUT -p icmp -j ACCEPT