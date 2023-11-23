data "azurerm_resource_group" "example" {
  name     = "DevOps-Resources"
}

resource "azurerm_subnet" "example" {
  name                 = "build-agent-subnet"
  resource_group_name  = data.azurerm_resource_group.example.name
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefixes     = ["10.0.1.0/24"]
}