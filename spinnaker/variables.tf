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

variable "SubnetOCID" {
}
variable "AD" {
    default = "1"
}
variable "InstanceShape" {
    default = "VM.Standard1.16"
}
variable "BootStrapFile" {
    default = "./userdata/bootstrap"
}
