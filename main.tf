resource "google_compute_firewall" "allow-iap-to-neo4j" {
  name = "allow-iap-to-neo4j-instance"
  description = "Allow traffic from iap to neo4j-instance"
  network =   var.network
  direction = "INGRESS"
  project = var.project_id
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
