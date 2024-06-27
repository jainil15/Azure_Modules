resource "azurerm_linux_virtual_machine" "this" {
  name                = "${var.env}-vm"
  resource_group_name = var.resource_group_name
  location            = var.location
  size                = var.size
  admin_username      = var.admin_username
  admin_ssh_key {
    username   = var.admin_username
    public_key = var.ssh_key
  }
  network_interface_ids = [var.nic_id]
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = var.os_storage_type
  }
  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}
