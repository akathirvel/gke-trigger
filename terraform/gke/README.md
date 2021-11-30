# Terraform - Provision a GKE Cluster
Terraform configuration files to provision a GKE cluster on GCP.

## Initialize Terraform workspace
`terraform init`

## Provision the GKE cluster
`terraform apply`

## Configure kubectl
`gcloud container clusters get-credentials $(terraform output -raw kubernetes_cluster_name) --region $(terraform output -raw region)`

## Rewrite Terraform configuration files to a canonical format and style
`terraform fmt`

## Kunfigure kubectl
`gcloud container clusters get-credentials gke-sunrise-devops --region europe-west6`

## Terraform documentation

* [Google Cloud Platform Provider Documentation](https://registry.terraform.io/providers/hashicorp/google/latest/docs)
* [Google Cloud Platform Machine Families](https://cloud.google.com/compute/docs/machine-types)
* [Provision a GKE Cluster Tutorial](https://learn.hashicorp.com/tutorials/terraform/gke?in=terraform/kubernetes)
