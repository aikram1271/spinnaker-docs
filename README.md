# Oracle Spinnaker Terraform

A Terraform provisioner to deploy a Spinnaker instance on Oracle Bare Metal Cloud.

#### Requires both Terraform and [Terraform Provider Bare Metal](https://github.com/oracle/terraform-provider-baremetal) to be installed.

## Getting started

You will need an Oracle Bare Metal account with associated credentials.

Copy the environment variable sample file and update it with your information.

```
cp env-vars.example env-vars
source env-vars
```

Create a Spinnaker instance on Oracle Bare Metal

```
terraform apply spinnaker
```

Destroy it

```
terraform destroy spinnaker
```

## Configuration

You can edit spinnaker/config/spinnaker-local.yml with your specific configuration and it will be installed automatically.

## FAQ

#### How do I expose Spinnaker port 9000 to a public IP?

This is generally not recommended unless you're Spinnaker instance is secure. If you do want to expose Spinnaker run the following to update IP Tables exposing port 9000 or your Oracle Bare Metal Ubuntu instance.

```
iptables -A INPUT -p tcp --dport 9000 -j ACCEPT
iptables -F
```

## TODO

1. Create the network
2. Enable upload of custom config file


## TODO

Configure for production using NGINX

Notes

```
To reconfigure a production spinnaker:
    (1) sudo /opt/spinnaker/scripts/stop_spinnaker.sh
    (2) edit /root/.spinnaker/spinnaker_config.cfg  (must be root)
    (3) sudo /opt/spinnaker/scripts/reconfigure_spinnaker.sh
    (4) sudo /opt/spinnaker/scripts/start_spinnaker.sh
```
