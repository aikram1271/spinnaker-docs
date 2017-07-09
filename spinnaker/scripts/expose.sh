# The following will make Spinnaker available on port 9000 of the instance public IP.
# ==================================================
iptables -A INPUT -p tcp --dport 9000 -j ACCEPT
iptables -F
