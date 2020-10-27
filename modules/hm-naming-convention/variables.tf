variable "region_name_map" {
  type    = map
  default = {
    US         = "us"
    us-east1   = "use1"
    us-east4   = "use4"
    us-west1   = "usw1"
    us-west2   = "usw2"
    us-west3   = "usw3"
    us-west4   = "usw4"
    g          = "g"
  }
}

variable "cloud_platform" {
  type        = string
  description = "Three character id for the cloud platform"
  default     = "gcp"
  validation {
    condition     = var.cloud_platform == "aws" || var.cloud_platform == "azr" || var.cloud_platform == "gcp"
    error_message = "The cloud platform value must be one of [aws, azr, gcp]."
  }
}

variable "project_name" {
  type        = string
  description = "Application project name provided by business"
  validation {
    condition     = length(var.project_name) >= 4 && length(var.project_name) <= 10
    error_message = "The project_name component of the naming convention must be 4-10 characters."
  }
}

variable "environment" {
  type        = string
  description = "Environment value for the resource"
  validation {
    condition     = var.environment == "d" || var.environment == "l" || var.environment == "p" || var.environment == "q" || var.environment == "s" || var.environment == "t"
    error_message = "The environment value must be one of [d, l, p, q, s, t]."
  }
}

variable "resource_type" {
  type        = string
  description = "Resource type notation for the resource"
  validation {
    condition     = length(var.resource_type) >= 3 && length(var.resource_type) <= 10
    error_message = "The resource_type component of the naming convention must be 3-10 characters."
  }
}

variable "region" {
  type        = string
  description = "Region notation for the resource"
  default     = "g"
  validation {
    condition     = length(var.region) >= 0 && length(var.region) <= 11
    error_message = "The region component of the naming convention must be 0-11 characters."
  }
}

variable "description" {
  type        = string
  description = "Optional additional description for the resource"
  default     = ""
  validation {
    condition     = length(var.description) >= 0 && length(var.description) <= 10
    error_message = "The description component of the naming convention must be 0-10 characters."
  }
}

variable "name_separator" {
  type        = string
  description = "Single character used as separator for name components"
  default     = "-"
  validation {
  	condition     = length(var.name_separator) == 1
  	error_message = "The name_separator value must be a single character."
  }
}