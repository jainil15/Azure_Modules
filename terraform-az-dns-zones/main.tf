resource "azurerm_dns_cname_record" "this" {
  name                = var.dns_name
  zone_name           = var.zone_name
  resource_group_name = var.resource_group_name
  ttl                 = 300
  target_resource_id  = var.target_resource_id
}
