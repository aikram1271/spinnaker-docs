#!/usr/bin/env bash

wget -q -O - https://pkg.jenkins.io/debian/jenkins-ci.org.key | apt-key add -
echo deb http://pkg.jenkins.io/debian-stable binary/ | tee /etc/apt/sources.list.d/jenkins.list
apt update
apt install -y jenkins

ufw allow 8080

iptables -A INPUT -p tcp --dport 9000 -j ACCEPT
iptables -F
