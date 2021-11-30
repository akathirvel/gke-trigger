variable "project_id" {
  description = "GCloud Project ID"
}

variable "region" {
  description = "GCloud Region - Location for regional resources (Regional resources are spread across several zones)"
}

variable "node_locations" {
  description = "GCloud Node Locations (Zones) - The list of zones in which the node pool's nodes should be located."
}

provider "google" {
  project = var.project_id
  region  = var.region
}
