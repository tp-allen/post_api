variable "location" {
  type        = string
  description = "azure region"
  default     = "north europe"
}

variable "envname" {
  type = string
}

variable "service" {
  type = string
}

variable "core_client_secret" {}
