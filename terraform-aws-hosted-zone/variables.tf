variable "cdn_endpoint_name" {
  type        = string
  description = "The name of the CDN endpoint"
}

variable "dns_name" {
  type        = string
  description = "The name of the DNS zone"
}

variable "aws_zone_id" {
  type        = string
  description = "The ID of the Route 53 hosted zone"
  sensitive   = true
}
