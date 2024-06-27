terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.99.0"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }

  }
}

provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
}

provider "aws" {
  region = "ap-south-1"

}


module "resource_group" {
  source   = "../terraform-az-rg"
  location = var.location
  env      = var.env

}

module "storage_account" {
  source               = "../terraform-az-storage-account"
  resource_group_name  = module.resource_group.name
  location             = module.resource_group.location
  env                  = var.env
  storage_account_name = var.storage_account_name
}

module "cdn" {
  source                       = "../terraform-az-cdn"
  resource_group_name          = module.resource_group.name
  location                     = module.resource_group.location
  env                          = var.env
  storage_primary_web_endpoint = module.storage_account.primary_web_endpoint
  domain_name                  = var.zone_name
  dns_cname_record             = module.dns_zones.dns_cname_record_id
  dns_name                     = var.dns_name
}

module "dns_zones" {
  source              = "../terraform-az-dns-zones"
  resource_group_name = "jainilpatel.tech"
  env                 = var.env
  zone_name           = var.zone_name
  target_resource_id  = module.cdn.endpoint_id
  dns_name            = var.dns_name
}

module "aws_hosted_zone" {
  source            = "../terraform-aws-hosted-zone"
  dns_name          = var.dns_name
  aws_zone_id       = var.aws_zone_id
  cdn_endpoint_name = module.cdn.endpoint_name
}

# module "vnet" {
#   source              = "../terraform-az-vnet"
#   resource_group_name = module.resource_group.name
#   location            = module.resource_group.location
#   env                 = var.env
#   address_space       = var.address_space
#   public_subnet_cidrs = var.public_subnet_cidrs
#   security_group_id   = module.nsg.sg_id
# }

# module "nsg" {
#   source              = "../terraform-az-nsg"
#   resource_group_name = module.resource_group.name
#   location            = module.resource_group.location
#   env                 = var.env
#   ports               = var.ports
# }

# module "vm" {
#   source              = "../terraform-az-vm"
#   resource_group_name = module.resource_group.name
#   location            = module.resource_group.location
#   env                 = var.env
#   size                = var.vm_size
#   admin_username      = var.admin_username
#   ssh_key             = file("./.ssh/id_rsa.pub")
#   nic_id              = module.vnet.nic_id
#   os_storage_type     = var.os_storage_type
# }
