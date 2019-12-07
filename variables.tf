# Variables



variable ssh_label {
  description = "ssh label"
  default     = "wcpclouduk1"
}


variable ssh_public_key {
  description = "ssh public key"
}

variable ssh_private_key {
  description = "SSH Private key to allow automation to access to VSI to install AWX"
}


variable ssh_notes {
  description = "ssh public key notes"
  default     = "SSH key for remote access to web site"
}



