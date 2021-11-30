# VPC
resource "google_compute_network" "vpc" {
  name = "vpc-${var.project_id}"
}
