data "azurerm_resource_group" "recovered_resource_group" {
  name     = var.name_group
}

resource "azurerm_storage_account" "account_storage" {
  name                     = var.storage_account_name
  resource_group_name      = data.azurerm_resource_group.recovered_resource_group.name
  location                 = data.azurerm_resource_group.recovered_resource_group.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "container" {
  name                  = var.container_name
  storage_account_name  = azurerm_storage_account.account_storage.name
  container_access_type = "private"
}

output "storage_account_name" {
  value = azurerm_storage_account.account_storage.name
}

output "container_name" {
  value = azurerm_storage_container.container.name
}

output "primary_access_key" {
  value     = azurerm_storage_account.account_storage.primary_access_key
  sensitive = true
}

resource "local_file" "output_json" {
  filename = "output.json"
  content  = jsonencode({
    storage_account_name    = azurerm_storage_account.account_storage.name,
    container_name          = azurerm_storage_container.container.name,
    primary_access_key      = azurerm_storage_account.account_storage.primary_access_key,
  })
}