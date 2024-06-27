variable "env" {
  type = string
  description = "The environment name"
}

variable "resource_group_name" {
  type        = string
  description = "The name of the resource group"
}

variable "location" {
  type        = string
  description = "The region for the resource group"
}

variable "ports" {
  type = list(number)
  description = "The ports to open"
}
