#!/usr/bin/env bash

wget -q -O - https://pkg.jenkins.io/debian/jenkins-ci.org.key | apt-key add -
echo deb http://pkg.jenkins.io/debian-stable binary/ | tee /etc/apt/sources.list.d/jenkins.list

apt update
apt install -y jenkins

iptables -A INPUT -p tcp --dport 8080 -j ACCEPT
iptables -F
