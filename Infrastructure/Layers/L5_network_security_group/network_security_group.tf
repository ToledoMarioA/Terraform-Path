resource "azurerm_network_security_group" "network_security_group" {
  name                = "build-agent-nsg"
  location            = var.recover_resource_location
  resource_group_name = var.recover_resource_name

  security_rule {
    name                       = "allow_ssh"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "allow_http"
    priority                   = 200
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

output "name" {
  value = azurerm_network_security_group.network_security_group.name
}
output "id" {
  value = azurerm_network_security_group.network_security_group.id
}