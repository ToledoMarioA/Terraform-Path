resource "azurerm_public_ip" "public_ip" {
  name                         = "build-agent-public-ip"
  location                     = var.recover_resource_location
  resource_group_name          = var.recover_resource_name
  allocation_method            = "Static"
}

output "name" {
  value = azurerm_public_ip.public_ip.name
}

output "id" {
  value = azurerm_public_ip.public_ip.id
}