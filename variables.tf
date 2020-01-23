variable "network" {
  description = "network the firewall rule will be deployed in"
}

variable "project_id" {
  description = "project id for the firewall rules"
}

variable "target_tags" {
  description = "what instances will this firewall rule be applied to"
}

variable "source_address_cidr_1" {
  description = "what cidr block will be granted access to this instance"
}