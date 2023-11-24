resource "azurerm_network_interface" "network_interface" {
  name                = "build-agent-nic"
  location            = var.recover_resource_location
  resource_group_name = var.recover_resource_name

  ip_configuration {
    name                          = "build-agent-ipconfig"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = var.public_ip_id
  }
}

output "name" {
  value = azurerm_network_interface.network_interface.name
}
output "id" {
  value = azurerm_network_interface.network_interface.id
}