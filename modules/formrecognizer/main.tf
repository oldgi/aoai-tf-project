
resource "azurerm_cognitive_account" "form" {
  name                = var.form_name
  location            = var.location
  resource_group_name = var.resource_group
  kind                = "FormRecognizer"
  sku_name            = "S0"
}
