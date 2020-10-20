provider "google" {
 project    = var.project_id
 region     = var.region
 zone       = var.zone
}

terraform {
  required_version = ">= 0.13.4"
  backend "gcs" {
    bucket  = var.state_bucket
    prefix  = "terraform/state"
  }
}