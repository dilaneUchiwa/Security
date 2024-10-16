#!/bin/sh

cp /etc/init.d/security/lib-systemd-system/firewall.service /lib/systemd/system/firewall.service

sudo systemctl enable firewall.service
sudo systemctl start firewall.service
