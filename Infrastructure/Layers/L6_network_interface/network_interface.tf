data "azurerm_resource_group" "example" {
  name     = "DevOps-Resources"
}

resource "azurerm_network_interface" "example" {
  name                = "build-agent-nic"
  location            = data.azurerm_resource_group.example.location
  resource_group_name = data.azurerm_resource_group.example.name

  ip_configuration {
    name                          = "build-agent-ipconfig"
    subnet_id                     = azurerm_subnet.example.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.example.id
  }
}