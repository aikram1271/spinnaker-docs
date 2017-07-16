resource "baremetal_core_instance" "SpinnakerBMCInstance" {
  availability_domain = "${lookup(data.baremetal_identity_availability_domains.ADs.availability_domains[var.ad - 1],"name")}"
  compartment_id = "${var.compartment_ocid}"
  display_name = "spinnaker-terraform"
  hostname_label = "spinnaker-terraform"
  image = "ocid1.image.oc1.phx.aaaaaaaak2idogwetkehtdvo7m673ojuucpfxhybd3ehun7izzgjqi4c4gga"
  shape = "${var.shape}"
  subnet_id = "${var.subnetOCID}"
  metadata {
    ssh_authorized_keys = "${file(var.ssh_public_key)}"
  }

  timeouts {
    create = "20m"
  }

  connection {
    host = "${self.public_ip}"
    type = "ssh"
    user = "ubuntu"
    private_key = "${file(var.ssh_private_key)}"
  }

  provisioner "remote-exec" {
    inline = [
      "mkdir -p /tmp/terraform/"
    ]
  }

  provisioner "file" {
    source = "spinnaker/scripts"
    destination = "/tmp/terraform"
  }
  provisioner "file" {
    source = "spinnaker/config/spinnaker-local.yml"
    destination = "/tmp/spinnaker-local.yml"
  }
  provisioner "file" {
    source = "${var.private_key_path}"
    destination = "/tmp/bmcs_api_key.pem"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod a+x /tmp/terraform/scripts/install_spinnaker.sh",
      "sudo /tmp/terraform/scripts/install_spinnaker.sh",
      "sudo mv /tmp/spinnaker-local.yml /opt/spinnaker/config/",
      "sudo mkdir -p /home/spinnaker/.oraclebmc",
      "sudo mv /tmp/bmcs_api_key.pem /home/spinnaker/.oraclebmc/",
      "sudo chown -R spinnaker:spinnaker /home/spinnaker/.oraclebmc/"
    ]
  }
}
