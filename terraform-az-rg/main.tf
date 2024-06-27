resource "azurerm_resource_group" "this" {
  name     = "${var.env}-rg"
  location = var.location
  tags = {
    environment = var.env
  }
}
