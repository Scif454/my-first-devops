#!/bin/bash

echo "Сброс существующих правил..."
sudo iptables -F
sudo iptables -X
sudo iptables -t nat -F


sudo iptables -P INPUT DROP
sudo iptables -P FORWARD DROP 
sudo iptables -P OUTPUT ACCEPT 


sudo iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT


sudo iptables -A INPUT -i lo -j ACCEPT 


sudo iptables -A INPUT -p tcp --dport 22 -s 192.168.1.100 -j ACCEPT


sudo iptables -t nat -A PREROUTING -p tcp --dport 8080 -j REDIRECT --to-port 80


sudo mkdir -p /etc/iptables 


sudo iptables-save | sudo tee /etc/iptables/rules.v4 > /dev/null


echo "Правила успешно применены и сохранены в /etc/iptables/rules.v4"
