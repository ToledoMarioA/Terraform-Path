# Crea un grupo de recursos con etiquetas
resource "azurerm_resource_group" "hello_world_resource_group" {
  name     = "Resources_OXXO_IaC_01"
  location = "East US"
  tags = {
    environment = "development"
    project     = "Hello World"
    prupouse = "IaC Course"
  }
}