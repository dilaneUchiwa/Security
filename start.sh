#!/bin/sh

chmod u+x /etc/init.d/security/parefeu.sh
/etc/init.d/security/parefeu.sh

apt update
apt install fail2ban -y
cp /etc/init.d/security/etc-fail2ban-jail.d/custum.conf /etc/fail2ban/jail.d/custum.conf
systemctl restart fail2ban