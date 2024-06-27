variable "subscription_id" {
  type        = string
  description = "The subscription ID"
  sensitive   = true
}

variable "env" {
  type        = string
  description = "The environment name"
}

variable "location" {
  type        = string
  description = "The region for the resource group"
}

variable "resource_group_name" {
  type        = string
  description = "The name of the resource group"
}

variable "address_space" {
  type        = list(string)
  description = "The address space for the virtual network"
}

variable "public_subnet_cidrs" {
  type        = list(string)
  description = "The CIDR blocks for the public subnets"
}

variable "ports" {
  type        = list(number)
  description = "The ports to open in the network security group"
}

variable "vm_size" {
  type        = string
  description = "The size of the virtual machine"
}

variable "admin_username" {
  type        = string
  description = "The admin username for the virtual machine"
  sensitive   = true
}

# variable "ssh_key" {
#   type = string
#   description = "The SSH public key"
#   sensitive = true
# }

variable "os_storage_type" {
  type        = string
  description = "The storage type for the OS disk"
  default     = "Standard_LRS"
}

variable "storage_account_name" {
  type        = string
  description = "The name of the storage account"
}

variable "zone_name" {
  type        = string
  description = "The name of the DNS zone"
}

variable "dns_name" {
  type        = string
  description = "Name of the DNS"
}

variable "aws_zone_id" {
  type        = string
  description = "The ID of the Route 53 hosted zone"
  sensitive   = true
}
