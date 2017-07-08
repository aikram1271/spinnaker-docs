# The following will make Spinnaker available on port 9000 of the instance public IP.
# ==================================================

echo "Listen 0.0.0.0:9000" >> /etc/apache2/ports.conf
sed -i 's#VirtualHost 127.0.0.1:9000#VirtualHost 0.0.0.0:9000#g' /etc/apache2/sites-enabled/spinnaker.conf
service apache2 restart

iptables -A INPUT -p tcp --dport 9000 -j ACCEPT
iptables -F
