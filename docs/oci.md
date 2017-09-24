# Install Spinnaker with the OCI cloud provider

The following guide will show you how to manually install and configure the OCI cloud provider for Spinnaker.

## Prerequisites

* An OCI account with credentials (including an oci_api_key.pem file)
* An Ubuntu 14.04 machine running on OCI

## Setup

Copy your API key onto the machine

```bash
scp -i ~/Keys/spinnaker ~/.oci/oci_api_key.pem ubuntu@PUBLIC_IP:/home/ubuntu/
```

Then connect to your instance and use Halyard to install Spinnaker.

```bash
ssh ubuntu@PUBLIC_IP
```

## Using Halyard

We recommend Halyard for installing and configuring Spinnaker. Provided you have a set of BMCS API credentials, 
the following steps will install Spinnaker on your Bare Metal Account. 

Halyard and Spinnaker (currently) only work with Ubuntu 14.04

```bash
sudo apt update

curl -O https://raw.githubusercontent.com/spinnaker/halyard/master/install/stable/InstallHalyard.sh
sudo bash InstallHalyard.sh

hal config version edit --version=1.1.1

hal config provider oci enable

hal config provider oci account add DEFAULT \
--compartment-id "ocid1.compartment.oc1..XXX" \
--region "us-phoenix-1" \
--ssh-private-key-file-path "/home/ubuntu/oci_api_key.pem" \
--tenancyId "ocid1.tenancy.oc1..XXX" \
--user-id "ocid1.user.oc1..XXX" \
--fingerprint "a4:bb:34:43:54:c5..."

hal config storage oci edit \
--bucket-name "spinnaker" \
--compartment-id "ocid1.compartment.oc1..XXX" \
--fingerprint "a4:bb:34:43:54:c5..." \
--namespace "spinnaker" \
--region "us-phoenix-1" \
--ssh-private-key-file-path "/home/ubuntu/oci_api_key.pem" \
--tenancy-id "ocid1.tenancy.oc1..XXX" \
--user-id "ocid1.user.oc1..XXX"

hal config storage edit --type oci

sudo hal deploy apply
```
