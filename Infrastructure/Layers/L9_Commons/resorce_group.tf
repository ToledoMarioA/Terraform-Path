data "azurerm_resource_group" "recover_resource" {
  name     = "Resources_OXXO_IaC_01"
}
output "name" {
  value = data.azurerm_resource_group.recover_resource.name
}
output "location" {
  value = data.azurerm_resource_group.recover_resource.location
}