resource "azurerm_network_security_group" "this" {
  name                = "${var.env}-nsg"
  location            = var.location
  resource_group_name = var.resource_group_name
  tags = {
    environment = var.env
  }
}

resource "azurerm_network_security_rule" "inbound" {
  name                        = "${var.env}-nsg-inbound-rule"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  source_port_range           = "*"
  destination_port_ranges     = var.ports
  resource_group_name         = var.resource_group_name
  network_security_group_name = azurerm_network_security_group.this.name
}

resource "azurerm_network_security_rule" "outbound" {
  name                        = "${var.env}-nsg-outbound-rule"
  priority                    = 100
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  resource_group_name         = var.resource_group_name
  network_security_group_name = azurerm_network_security_group.this.name
}
