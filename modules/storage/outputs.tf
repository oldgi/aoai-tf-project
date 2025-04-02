
output "storage_account_name" {
  value = azurerm_storage_account.blob.name
}

output "resource_group_name" {
  value = azurerm_resource_group.main.name
}
