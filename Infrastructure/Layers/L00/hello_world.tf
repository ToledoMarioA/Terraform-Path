terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.59.0"
    }
  required_version = ">= 1.1.0"
}

}
provider "azurerm" {
  
  subscription_id = ""
  client_id       = ""
  client_secret   = ""
  tenant_id       = ""
  features {
  }
  skip_provider_registration = true
}

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