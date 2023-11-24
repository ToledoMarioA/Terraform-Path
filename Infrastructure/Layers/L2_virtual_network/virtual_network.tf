resource "azurerm_virtual_network" "virtual_network" {
  name                = "build-agent-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = var.recover_resource_location
  resource_group_name = var.recover_resource_name
}
output "name" {
  value = azurerm_virtual_network.virtual_network.name
}