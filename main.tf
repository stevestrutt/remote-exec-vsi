resource "ibm_compute_ssh_key" "ssh_key" {
  label      = "${var.ssh_label}"
  notes      = "${var.ssh_notes}"
  public_key = "${var.ssh_key}"
}

########################################################
# Create VM configured to for SSH remote access
########################################################

resource "ibm_compute_vm_instance" "webapp1" {
  datacenter        = "lon06"
  domain            = "wcpcloud.com"
  hostname          = "remotex"
  count             = 1
  ssh_key_ids       = ["${ibm_compute_ssh_key.ssh_key.id}"]
  os_reference_code = "CENTOS_LATEST_64"
  flavor_key_name   = "B1_1X4X100"
  local_disk        = false

  private_security_group_ids = ["${ibm_security_group.sg_private_lamp.id}"]
  public_security_group_ids  = ["${ibm_security_group.sg_public_lamp.id}"]
  private_network_only       = false

  tags = ["stevestrutt",  "ansible", "awx"]

  connection {
    user = "root"
    private_key = "${var.ssh_private_key}"
  }

  provisioner "remote-exec" {
    script = "update.sh"
  }

}

# data "ibm_resource_group" "group" {
#   name = "Default"
# }
