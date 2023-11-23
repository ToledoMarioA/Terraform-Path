data "azurerm_resource_group" "example" {
  name     = "DevOps-Resources"
}

resource "azurerm_virtual_network" "example" {
  name                = "build-agent-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = data.azurerm_resource_group.example.location
  resource_group_name = data.azurerm_resource_group.example.name
}
