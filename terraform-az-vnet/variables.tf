variable "env" {
  type        = string
  description = "The environment name"
}

variable "location" {
  type        = string
  description = "The region for the resource group"
}

variable "address_space" {
  type        = list(string)
  description = "CIDR block for the virtual network"
}

variable "resource_group_name" {
  type        = string
  description = "The name of the resource group"
}

variable "private_subnet_cidrs" {
  type        = list(string)
  description = "CIDR blocks for the private subnets"
  default     = []
}

variable "public_subnet_cidrs" {
  type        = list(string)
  description = "CIDR blocks for the public subnets"
}

variable "primary_nic" {
  type        = bool
  description = "Is this the primary NIC?"
  default     = true
}

variable "security_group_id" {
  type = string
  description = "The ID of the network security group to associate with the NIC"
}