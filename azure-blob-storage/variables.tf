variable "resource_group_name" {
  description = "Nazwa grupy zasobów"
  type        = string
}

variable "resource_group_location" {
  description = "Lokalizacja grupy zasobów"
  type        = string
}

variable "storage_account_name" {
  description = "Nazwa konta składowania"
  type        = string
}

variable "account_tier" {
  description = "Poziom konta"
  type        = string
}

variable "account_replication_type" {
  description = "Typ replikacji konta"
  type        = string
}

variable "storage_container_name" {
  description = "Nazwa kontenera składowania"
  type        = string
}

variable "container_access_type" {
  description = "Typ dostępu do kontenera"
  type        = string
}

variable "storage_blob_name" {
  description = "Nazwa bloba składowania"
  type        = string
}

variable "blob_type" {
  description = "Typ bloba"
  type        = string
}

variable "source_path" {
  description = "Ścieżka źródłowa do pliku do przesłania"
  type        = string
}
