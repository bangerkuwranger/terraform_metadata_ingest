locals {
  region_final = var.region_name_map["${var.region}"]
  desc_final = (var.description != "" ? "${var.description}-" : "")
}

output "resource_name" {
  description = "Full resource name based on input variables."
  value       = "gcp-${var.project_name}-${var.environment}-${var.resource_type}-${local.region_final}-${local.desc_final}${random_id.suffix.hex}"
}