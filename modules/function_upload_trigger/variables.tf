
variable "function_name" {
  description = "Name of the Function App"
  type        = string
}

variable "resource_group" {
  type = string
}

variable "location" {
  type = string
}

variable "search_trigger_url" {
  description = "HTTP endpoint for triggering the search indexer"
  type        = string
}
