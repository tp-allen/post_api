variable "location" {
  type        = string
  description = "Azure Region"
  default     = "north europe"
}

variable "envname" {
  description = "Environment Name for this deployment"
  type = string
}

variable "service" {
  description = "Name of the Application using the resources"
  type = string
}

variable "core_client_secret" {}
