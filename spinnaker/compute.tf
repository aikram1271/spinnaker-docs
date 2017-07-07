resource "baremetal_core_instance" "SpinnakerBMCInstance" {
  availability_domain = "${lookup(data.baremetal_identity_availability_domains.ADs.availability_domains[var.ad - 1],"name")}" 
  compartment_id = "${var.compartment_ocid}"
  display_name = "spinnaker-terraform"
  hostname_label = "spinnaker-terraform"
  image = "ocid1.image.oc1.phx.aaaaaaaak2idogwetkehtdvo7m673ojuucpfxhybd3ehun7izzgjqi4c4gga"
  shape = "${var.shape}"
  subnet_id = "${var.subnetOCID}"
  metadata {
    ssh_authorized_keys = "${var.ssh_public_key}"
  }
  timeouts {
    create = "60m"
  }
  
  provisioner "remote-exec" {
    script = "spinnaker/userdata/bootstrap"
    connection {
      type     = "ssh"
      user     = "ubuntu"
      host     = "${data.baremetal_core_vnic.InstanceVnic.public_ip_address}"
    }
  }
  
  provisioner "file" {
    source      = "spinnaker/conf/spinanker-local.yml"
    destination = "/opt/spinnaker/conf/spinnaker-local.yml"

    connection {
      type     = "ssh"
      user     = "ubuntu"
    }
  }
}
