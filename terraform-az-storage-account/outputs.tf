output "primary_web_endpoint" {
  value       = azurerm_storage_account.this.primary_web_endpoint
  description = "The primary endpoint for the static website"
}
