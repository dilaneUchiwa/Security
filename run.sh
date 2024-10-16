#!/bin/sh

cp ./lib-systemd-system/firewall.service /lib/systemd/system/firewall.service

sudo systemctl enable firewall.service
sudo systemctl start firewall.service
