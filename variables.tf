variable "network" {
  description = "network the firewall rule will be deployed in"
}

variable "project_id" {
  description = "project id for the firewall rules"
}

variable "target_tags" {
  description = "what instances will this firewall rule be applied to"
}

variable "source_address_cidr" {
  description = "what cidr block will be granted access to this instance"
}

variable "jenkins_source_address_cidr" {
  description = "what cidr block will be granted access to this instance"
}

variable "afrl_subnet" {
  description = "subnet for firewall rules"
}

variable "iap_source_address_cidr" {
  description = "allow iap access to compute instances"
}