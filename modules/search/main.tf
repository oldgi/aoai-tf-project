
resource "azurerm_search_service" "cogsearch" {
  name                = var.search_name
  resource_group_name = var.resource_group
  location            = var.location
  sku                 = "basic"
  replica_count       = 1
  partition_count     = 1
}
