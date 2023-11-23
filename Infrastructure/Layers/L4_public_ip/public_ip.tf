data "azurerm_resource_group" "example" {
  name     = "DevOps-Resources"
}

resource "azurerm_public_ip" "example" {
  name                         = "build-agent-public-ip"
  location                     = data.azurerm_resource_group.example.location
  resource_group_name          = data.azurerm_resource_group.example.name
  allocation_method            = "Static"
}