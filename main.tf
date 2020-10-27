terraform {
  required_version = ">= 0.13.4"
  backend "gcs" {
    bucket  = "gcp-metadata-d-csb-use4-89jw"
    prefix  = "terraform/state"
  }
}

locals {
  name_region = (var.zone != "" ? var.zone : var.region)
  bq_region   = (var.environment == "p" ? "US" : var.region)
  gcs_region  = (var.environment == "p" ? "US" : local.name_region)
}

module "gcs_bucket_name" {
  source = "./modules/hm-naming-convention"
  project_name = var.application_name
  environment = var.environment
  resource_type = "csbk"
  region = local.name_region
  description = var.application_description
}

module "bq_dataset_name" {
  source = "./modules/hm-naming-convention"
  project_name = var.application_name
  environment = var.environment
  resource_type = "bqds"
  region = local.bq_region
  description = var.application_description
}

provider "google" {
 project    = var.project_id
 region     = var.region
 zone       = var.zone
}

resource "google_storage_bucket" "ingest_bucket" {
  name          = module.gcs_bucket_name.resource_name
  force_destroy = true
  location      = local.gcs_region
  lifecycle_rule {
    condition {
      num_newer_versions = 2
    }
    action {
      type          = "SetStorageClass"
      storage_class = "ARCHIVE"
    }
  }
  lifecycle_rule {
    condition {
      matches_storage_class = ["ARCHIVE"]
      age = 180
    }
    action {
      type = "Delete"
    }
  }
  versioning {
    enabled = true
  }
  uniform_bucket_level_access = true
}

resource "google_bigquery_dataset" "dataset" {
  dataset_id                  = module.bq_dataset_name.resource_name
  friendly_name               = "${var.application_name}-${var.environment}-output"
  description                 = "Output dataset for combined, cleaned files"
  location                    = local.bq_region
  project                     = var.project_id
  delete_contents_on_destroy  = true
}
