
provider "azurerm" {
  features {
    resource_group {
      prevent_deletion_if_contains_resources = true
    }
  }
  subscription_id = var.subscription_id
}

module "storage" {
  source                = "./modules/storage"
  location              = var.location
  resource_group        = var.resource_group
  storage_account_name  = var.storage_account_name
}

module "formrecognizer" {
  source         = "./modules/formrecognizer"
  location       = var.location
  resource_group = var.resource_group
  form_name      = var.form_name
}

module "search" {
  source         = "./modules/search"
  location       = var.location
  resource_group = var.resource_group
  search_name    = var.search_name
}

module "function_upload_trigger" {
  source              = "./modules/function_upload_trigger"
  location            = var.location
  resource_group      = var.resource_group
  function_name       = var.function_name
  search_trigger_url  = var.search_trigger_url
}
