variable "target_tags" {
  description = "what instances will this firewall rule be applied to"
}

variable "source_address_cidr" {
  description = "what cidr block will be granted access to this instance"
}

variable "jenkins_source_address_cidr" {
  description = "what cidr block will be granted access to this instance"
}

variable "iap_source_address_cidr" {
  description = "allow iap access to compute instances"
}

variable "network" {
  description = "network to deploy firewalls"
}