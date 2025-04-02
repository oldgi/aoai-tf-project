
variable "location" {
  default = "eastus"
}

variable "resource_group" {
  default = "aoai-rg"
}

variable "subscription_id" {
  type = string
}

variable "storage_account_name" {
  default = "aoaiblobstore"
}

variable "form_name" {
  default = "aoai-form"
}

variable "search_name" {
  default = "aoai-search0401"
}

variable "function_name" {
  default = "aoaiupload01"
}

variable "search_trigger_url" {
  default = "https://your-search-url/indexers/your-indexer/run?api-version=2021-04-30-Preview"
}
