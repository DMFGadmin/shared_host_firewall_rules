data "terraform_remote_state" "project-and-networks" {
  backend = "remote"
  config = {
    organization = "AFRLDigitalMFG"
    workspaces = {
      name = "shared_vpc_projects"
    }
  }
}
resource "google_compute_firewall" "allow-iap-to-neo4j" {
  name = "allow-iap-to-neo4j"
  description = "Allow traffic from iap to neo4j-instance"
  network =   "projects/${data.terraform_remote_state.project-and-networks.outputs.shared-vpc-name}/global/networks/${data.terraform_remote_state.project-and-networks.outputs.afrl-shared-vpc-network-name}"
  direction = "INGRESS"
  project = data.terraform_remote_state.project-and-networks.outputs.shared-vpc-name
  disabled = "false"
  priority = 1000
  enable_logging = "true"

  allow {
    protocol = "tcp"
  }

  target_tags = ["${var.target_tags}"]
  source_ranges = ["${var.iap_source_address_cidr}"]
}

resource "google_compute_firewall" "allow-traffic-from-jenkins" {
  name = "allow-traffic-from-jenkins"
  description = "Allow jenkins traffic"
  network =  "projects/${data.terraform_remote_state.project-and-networks.outputs.shared-vpc-name}/global/networks/${data.terraform_remote_state.project-and-networks.outputs.afrl-shared-vpc-network-name}"
  direction = "INGRESS"
  project = data.terraform_remote_state.project-and-networks.outputs.shared-vpc-name
  disabled = "false"
  priority = 1000
  enable_logging = "true"

  allow {
    protocol = "tcp"
  }

  source_ranges = ["${var.jenkins_source_address_cidr}"]
}