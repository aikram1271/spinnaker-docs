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
}
variable "ssh_private_key" {
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
