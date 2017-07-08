variable "tenancy_ocid" {}
variable "user_ocid" {}
variable "fingerprint" {}
variable "private_key_path" {}
variable "compartment_ocid" {}
variable "subnetOCID" {}

variable "ssh_public_key" {
  description = "The path to your public key used to connect to the instance"
  default = "~/.ssh/id_rsa.pub"
}

variable "ssh_private_key" {
  description = "The path to your private key used to connect to the instance"
  default = "~/.ssh/id_rsa"
}

variable "ad" {
  description = "The availability domain in which to launch the Spinnaker instance"
  default = "1"
}

variable "shape" {
  descript = "The size for the main Spinnaker instance"
  default = "VM.Standard1.16"
}
