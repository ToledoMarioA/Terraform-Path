resource "azurerm_subnet" "subnet" {
  name                 = "build-agent-subnet"
  resource_group_name  = var.recover_resource_name
  virtual_network_name = var.virtual_network_name
  address_prefixes     = ["10.0.1.0/24"]
}

output "name" {
  value = azurerm_subnet.subnet.name
}
output "id" {
  value = azurerm_subnet.subnet.id
}