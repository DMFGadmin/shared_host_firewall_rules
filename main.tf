resource "google_compute_firewall" "allow-ssh-to-neo4j" {
  name = "allow-ssh-to-neo4j-instance"
  description = "Allow port 22 from approved addresses"
  network =   var.network
  direction = "INGRESS"
  project = var.project_id
  disabled = "false"
  priority = 1000
  enable_logging = "true"

  allow {
    protocol = "tcp"
    ports = ["22"]
  }

  target_tags = ["${var.target_tags}"]
  source_ranges = ["${var.source_address_cidr}"]
}

resource "google_compute_firewall" "allow-traffic-from-jenkins" {
  name = "allow-traffic-from-jenkins"
  description = "Allow jenkins traffic"
  network =   var.network
  direction = "INGRESS"
  project = var.project_id
  disabled = "false"
  priority = 1000
  enable_logging = "true"

  allow {
    protocol = "tcp"
  }

  source_ranges = ["${var.jenkins_source_address_cidr}"]
}