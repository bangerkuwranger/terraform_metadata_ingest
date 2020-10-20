variable "cloud_platform" {
  type        = "string"
  description = "Three character id for the cloud platform"
  default     = "gcp"
  validation {
    condition     = var.cloud_platform == "aws" || var.cloud_platform == "azr" || var.cloud_platform == "gcp"
    error_message = "The cloud platform value must be one of [aws, azr, gcp]."
  }
}

variable "project_name" {
  type        = "string"
  description = "Application project name provided by business"
  validation {
    condition     = var.project_name.length >= 4 && var.project_name.length <= 10
    error_message = "The project_name component of the naming convention must be 4-10 characters."
  }
}

variable "environment" {
  type        = "string"
  description = "Environment value for the resource"
  validation {
    condition     = var.environment == "d" || var.environment == "l" || var.environment == "p" || var.environment == "q" || var.environment == "s" || var.environment == "t"
    error_message = "The environment value must be one of [d, l, p, q, s, t]."
  }
}

variable "resource_type" {
  type        = "string"
  description = "Resource type notation for the resource"
  validation {
    condition     = var.resource_type.length >= 3 && var.resource_type.length <= 10
    error_message = "The resource_type component of the naming convention must be 3-10 characters."
  }
}

variable "region" {
  type        = "string"
  description = "Region/zone notation for the resource"
  default     = ""
  validation {
    condition     = var.region.length >= 0 && var.region.region <= 6
    error_message = "The region component of the naming convention must be 0-6 characters."
  }
}

variable "description" {
  type        = "string"
  description = "Optional additional description for the resource"
  default     = ""
  validation {
    condition     = var.description.length >= 0 && var.description.region <= 10
    error_message = "The description component of the naming convention must be 0-10 characters."
  }
}