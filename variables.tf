variable "project_id" {
  type        = string
  description = "GCP id value for the target project"
}

variable "region" {
  type        = string
  description = "Default GCP region value for deploying resources"
  default     = "g"
}

variable "zone" {
  type        = string
  description = "Default GCP zone value for deploying resources"
  default     = ""
}

variable "environment" {
  type        = string
  description = "Single character indicating environment"
  default     = "d"
  validation {
  	condition     = length(var.environment) == 1
  	error_message = "The environment value must be a single character."
  }
}

variable "application_name" {
  type        = string
  description = "Application name provided by business"
}

variable "application_description" {
  type        = string
  description = "Optional description to differentiate deployed resources"
  default     = ""
}