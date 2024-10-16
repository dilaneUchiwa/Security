#!/bin/sh

chmod u+x ./parefeu.sh
./parefeu.sh

apt update
apt install fail2ban -y
cp ./etc-fail2ban-jail.d/custum.conf /etc/fail2ban/jail.d/custum.conf
systemctl restart fail2ban