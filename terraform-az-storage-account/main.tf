resource "azurerm_storage_account" "this" {
  name                     = var.storage_account_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  account_kind             = "StorageV2"
  tags = {
    environment = var.env
  }
  static_website {
    index_document = "index.html"
  }
}

resource "azurerm_storage_blob" "this" {
  name                   = "index.html"
  storage_account_name   = azurerm_storage_account.this.name
  storage_container_name = "$web"
  type                   = "Block"
  content_type           = "text/html"
  source                 = "app/index.html"
}
