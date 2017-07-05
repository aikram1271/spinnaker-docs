resource "baremetal_core_instance" "SpinnakerBMCInstance" {
  availability_domain = "${lookup(data.baremetal_identity_availability_domains.ADs.availability_domains[var.AD - 1],"name")}" 
  compartment_id = "${var.compartment_ocid}"
  display_name = "spinnaker"
  hostname_label = "spinnaker"
  image = "ocid1.image.oc1.phx.aaaaaaaak2idogwetkehtdvo7m673ojuucpfxhybd3ehun7izzgjqi4c4gga"
  shape = "${var.InstanceShape}"
  subnet_id = "${var.SubnetOCID}"
  metadata {
    ssh_authorized_keys = "${var.ssh_public_key}"
    user_data = "${base64encode(file(var.BootStrapFile))}"
  }
  timeouts {
    create = "60m"
  }
}
