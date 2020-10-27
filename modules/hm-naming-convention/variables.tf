variable "region_name_map" {
  type    = map
  default = {
    US         = "us"
    us-east1   = "use1"
    us-east1-b = "use1b"
    us-east1-c = "use1c"
    us-east1-d = "use1d"
    us-east4   = "use4"
    us-east4-a = "use4a"
    us-east4-b = "use4b"
    us-east4-c = "use4c"
    us-west1   = "usw1"
    us-west1-a = "usw1a"
    us-west1-b = "usw1b"
    us-west1-c = "usw1c"
    us-west2   = "usw2"
    us-west2-a = "usw2a"
    us-west2-b = "usw2b"
    us-west2-c = "usw2c"
    us-west3   = "usw3"
    us-west3-a = "usw3a"
    us-west3-b = "usw3b"
    us-west3-c = "usw3c"
    us-west4   = "usw4"
    us-west4-a = "usw4a"
    us-west4-b = "usw4b"
    us-west4-c = "usw4c"
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
  description = "Region/zone notation for the resource"
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
  	condition     = length(var.environment) == 1
  	error_message = "The name_separator value must be a single character."
  }
}