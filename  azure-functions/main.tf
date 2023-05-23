resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.resource_group_location
}

resource "azurerm_storage_account" "storage_acc" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_app_service_plan" "app_service_plan" {
  name                = var.app_service_plan_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  kind                = "Linux"
  reserved            = true

  sku {
    tier = "Basic"
    size = "B1"
  }
}

resource "azurerm_linux_function_app" "linux_function_app" {
  name                       = var.linux_function_app_name
  resource_group_name        = azurerm_resource_group.rg.name
  location                   = azurerm_resource_group.rg.location
  app_service_plan_id        = azurerm_app_service_plan.app_service_plan.id
  storage_account_name       = azurerm_storage_account.storage_acc.name
  storage_account_access_key = azurerm_storage_account.storage_acc.primary_access_key
  version                    = "~3"
  os_type                    = "linux"

  site_config {
    app_scale_limit             = 1
    use_32_bit_worker_process   = false
    websockets_enabled          = false
    always_on                   = false
    linux_fx_version            = "DOTNETCORE|3.1"
    http2_enabled               = false
  }
}

resource "azurerm_function_app_function" "function_app_function" {
  name                      = var.function_app_function_name
  function_app_id           = azurerm_linux_function_app.linux_function_app.id
  filename                  = var.function_app_package_path
  entry_point               = "My.Function.EntryPoint"
  handler                   = "My.Handler"
  runtime                   = "dot
