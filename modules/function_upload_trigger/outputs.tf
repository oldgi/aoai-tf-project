
output "function_endpoint" {
  value = azurerm_linux_function_app.function.default_hostname
}
