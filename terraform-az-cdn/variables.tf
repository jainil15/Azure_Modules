variable "env" {
  description = "The environment name"
  type        = string
}

variable "location" {
  description = "The region for the resource group"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "storage_primary_web_endpoint" {
  description = "The primary endpoint for the static website"
  type        = string
}

variable "domain_name" {
  description = "The domain name for the custom domain"
  type        = string

}

variable "dns_cname_record" {
  description = "The DNS CNAME record for the custom domain"
  type        = string
}

variable "dns_name" {
  description = "Name of the DNS"
  type        = string
}
