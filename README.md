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

## TODO

1. Create the network
2. Enable upload of custom config file
