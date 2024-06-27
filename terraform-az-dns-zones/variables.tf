variable "env" {
  type        = string
  description = "The environment name"
}

variable "zone_name" {
  type        = string
  description = "The name of the DNS zone"
}

variable "resource_group_name" {
  type        = string
  description = "The name of the resource group"
}

variable "target_resource_id" {
  type        = string
  description = "The record value"
}

variable "dns_name" {
  type = string
  description = "The name of the DNS record"
}

