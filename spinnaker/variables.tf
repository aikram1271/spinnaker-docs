variable "tenancy_ocid" {
}

variable "user_ocid" {
}

variable "fingerprint" {
}

variable "private_key_path" {
}

variable "compartment_ocid" {
}

variable "ssh_public_key" {
    default = "~/.ssh/id_rsa.pub"
}
variable "ssh_private_key" {
    default = "~/.ssh/id_rsa"
}

variable "subnetOCID" {
}
variable "ad" {
    default = "1"
}
variable "shape" {
    default = "VM.Standard1.16"
}
variable "userdata" {
    default = "./spinnaker/userdata/bootstrap"
}
