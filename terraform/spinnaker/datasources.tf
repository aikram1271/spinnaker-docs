# Gets a list of Availability Domains
data "baremetal_identity_availability_domains" "ADs" {
    compartment_id = "${var.tenancy_ocid}"
}
# Gets a list of vNIC attachments on the instance
data "baremetal_core_vnic_attachments" "InstanceVnics" { 
    compartment_id = "${var.compartment_ocid}" 
    availability_domain = "${lookup(data.baremetal_identity_availability_domains.ADs.availability_domains[var.ad - 1],"name")}" 
    instance_id = "${baremetal_core_instance.SpinnakerBMCInstance.id}" 
} 
# Gets the OCID of the first (default) vNIC
data "baremetal_core_vnic" "InstanceVnic" { 
    vnic_id = "${lookup(data.baremetal_core_vnic_attachments.InstanceVnics.vnic_attachments[0],"vnic_id")}" 
}
