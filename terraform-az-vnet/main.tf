resource "azurerm_virtual_network" "this" {
  name                = "${var.env}-vnet"
  address_space       = var.address_space
  location            = var.location
  resource_group_name = var.resource_group_name
  tags = {
    environment = var.env
  }

}

# resource "azurerm_subnet" "private" {
#   count                = length(var.private_subnet_cidrs)
#   name                 = "${var.env}-private-${count.index}"
#   resource_group_name  = var.resource_group_name
#   virtual_network_name = azurerm_virtual_network.this.name
#   address_prefixes     = [var.private_subnet_cidrs[count.index]]
# }

resource "azurerm_subnet" "public" {
  count                = length(var.public_subnet_cidrs)
  name                 = "${var.env}-public-${count.index}"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.this.name
  address_prefixes     = [var.public_subnet_cidrs[count.index]]
}

resource "azurerm_public_ip" "this" {
  name                = "${var.env}-public-ip"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Dynamic"
  tags = {
    environment = var.env
  }
}

resource "azurerm_network_interface" "this" {
  name                = "${var.env}-nic"
  location            = var.location
  resource_group_name = var.resource_group_name
  ip_configuration {
    name                          = "${var.env}-ipconfig"
    subnet_id                     = azurerm_subnet.public[0].id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.this.id
    primary                       = var.primary_nic
  }
}

resource "azurerm_network_interface_security_group_association" "this" {
  network_interface_id = azurerm_network_interface.this.id
  network_security_group_id = var.security_group_id
}
