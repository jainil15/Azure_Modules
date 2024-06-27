variable "env" {
  type        = string
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

variable "size" {
  type        = string
  description = "The size of the virtual machine"
}

variable "admin_username" {
  type        = string
  description = "The admin username for the virtual machine"
  sensitive   = true
}

variable "ssh_key" {
  type        = string
  description = "The SSH public key"
  sensitive   = true
}

variable "nic_id" {
  type        = string
  description = "The ID of the network interface for VM"
}

variable "os_storage_type" {
  type        = string
  description = "The storage type for the OS disk"
  default     = "Standard_LRS"
}
