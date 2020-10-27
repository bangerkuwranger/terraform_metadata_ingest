locals {
  region_final = var.region_name_map[var.region]
  desc_final = (var.description != "" ? "${var.description}${var.name_separator}" : "")
}

output "resource_name" {
  description = "Full resource name based on input variables."
  value       = "gcp${var.name_separator}${var.project_name}${var.name_separator}${var.environment}${var.name_separator}${var.resource_type}${var.name_separator}${local.region_final}${var.name_separator}${local.desc_final}${random_id.suffix.hex}"
}