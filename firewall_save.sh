#!/bin/bash

sudo mkdir -p /etc/iptables

sudo iptables-save | sudo tee /etc/ipatbles/rules.v4 > /dev/null

echo "Правила сохранены в /etc/iptables/rules.v4"
