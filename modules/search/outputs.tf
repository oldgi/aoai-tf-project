
output "cognitive_search_endpoint" {
  value = azurerm_search_service.cogsearch.query_keys[0].key
}
