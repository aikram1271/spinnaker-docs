# Exposing Spinnaker

By default Spinnaker is deployed on a 'localhost' only setup meaning 
that you will need to use an SSH tunnel to access your Spinnaker instance.

If you want to make Spinnaker publically available you can run the following commands to do it

```
echo "host: 0.0.0.0" | tee \
    ~/.hal/default/service-settings/gate.yml \
    ~/.hal/default/service-settings/deck.yml

hal config security ui edit \
    --override-base-url http://spinnaker.mydomain.org:9000

hal config security api edit \
    --override-base-url http://spinnaker.mydomain.org:8084
    
sudo hal deploy apply
```

On many setups you'll need to ensure firewall ports are open. For example
an Oracle OCI Ubuntu 14.04 instance will need the following iptables rules set
as well as having `9000` and `8084` open in the security list for your VCN.

```
sudo iptables -A INPUT -p tcp --dport 9000 -j ACCEPT
sudo iptables -A INPUT -p tcp --dport 8084 -j ACCEPT
sudo iptables -F
```
