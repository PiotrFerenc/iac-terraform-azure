variable "resource_group_name" {
  description = "Nazwa dla grupy zasobów"
  type        = string
}

variable "resource_group_location" {
  description = "Lokalizacja dla grupy zasobów"
  type        = string
}

variable "storage_account_name" {
  description = "Nazwa dla konta przechowywania"
  type        = string
}

variable "app_service_plan_name" {
  description = "Nazwa dla planu usługi aplikacji"
  type        = string
}

variable "linux_function_app_name" {
  description = "Nazwa dla aplikacji funkcji Linux"
  type        = string
}

variable "function_app_function_name" {
  description = "Nazwa dla funkcji w aplikacji funkcji"
  type        = string
}

variable "function_app_package_path" {
  description = "Ścieżka do pakietu aplikacji funkcji"
  type        = string
}
