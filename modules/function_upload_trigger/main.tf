
# ✅ modules/function_upload_trigger/main.tf - 修正 resource 名稱與對應 ID

resource "azurerm_storage_account" "function_sa" {
  name                     = lower(replace("${var.function_name}sa", "-", ""))
  resource_group_name      = var.resource_group
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_service_plan" "plan" {
  name                = "${var.function_name}-plan"
  location            = var.location
  resource_group_name = var.resource_group
  os_type             = "Linux"
  sku_name            = "Y1"
}

resource "azurerm_linux_function_app" "function" {
  name                       = var.function_name
  location                   = var.location
  resource_group_name        = var.resource_group
  service_plan_id            = azurerm_service_plan.plan.id
  storage_account_name       = azurerm_storage_account.function_sa.name
  storage_account_access_key = azurerm_storage_account.function_sa.primary_access_key

  site_config {
    application_stack {
      python_version = "3.10"
    }
  }

  app_settings = {
    AzureWebJobsStorage       = azurerm_storage_account.function_sa.primary_connection_string
    FUNCTIONS_WORKER_RUNTIME  = "python"
    BLOB_CONTAINER_NAME       = "uploads"
    SEARCH_TRIGGER_URL        = var.search_trigger_url
  }
}

