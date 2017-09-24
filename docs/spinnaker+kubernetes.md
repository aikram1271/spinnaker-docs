# Spinnaker+Kubernetes

This guide will show you how to configure Spinnaker to deploy to Kubernetes on OCI.

### Prerequisites 

* An Ubuntu 14.04 machine
* A Kubernetes cluster with a kubeconfig file

If you want to use OCI storage, ensure that the private key is in /home/ubuntu/oci_api_key.pem

# Use OCI storage

```bash
scp -i ~/Keys/spinnaker ~/.oci/oci_api_key.pem ubuntu@129.213.29.220:/home/ubuntu/
```

Setup Spinnaker to use Kubernetes

```bash
curl -O https://raw.githubusercontent.com/spinnaker/halyard/master/install/stable/InstallHalyard.sh
sudo bash InstallHalyard.sh

## Docker

sudo apt-get update
sudo apt-get -y install linux-image-extra-$(uname -r) linux-image-extra-virtual
sudo apt-get install apt-transport-https ca-certificates curl software-properties-common 
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" 
sudo apt-get update
sudo apt-get install docker-ce   

# Spinnaker

hal config version edit --version=XXX

hal config provider docker-registry enable

hal config provider docker-registry account add docker \
--address index.docker.io \
--email owain@owainlewis.com \
--username owainlewis \
--password \
--repositories owainlewis/hello-spinnaker

hal config provider kubernetes enable

hal config provider kubernetes account add my-kubernetes-account --docker-registries=docker

hal config storage oci edit \
--bucket-name "spinnaker" \
--compartment-id "ocid1.compartment.oc1..aaaaaaaaob4ckouj3cjmf36ifjkff33wvln5fnnarumafqzpqq7tmbig2n5q" \
--fingerprint "a4:bb:34:43:54:c5:af:a5:4b:23:ce:82:2d:7f:12:45" \
--namespace "spinnaker" \
--region "us-phoenix-1" \
--ssh-private-key-file-path "/home/ubuntu/oci_api_key.pem" \
--tenancy-id "ocid1.tenancy.oc1..aaaaaaaaxf3fuazosc6xng7l75rj6uist5jb6ken64t3qltimxnkymddqbma" \
--user-id "ocid1.user.oc1..aaaaaaaa3p67n2kmpxnbcnffjow6j5bhe6jze3obob3cjdctfftyfd4zou2q"

hal config storage edit --type oci

sudo hal deploy apply
```
