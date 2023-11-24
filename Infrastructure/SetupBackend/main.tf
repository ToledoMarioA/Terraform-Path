terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.59.0"
    }
  }
  required_version = ">= 1.1.0"
}

provider "azurerm" {
  subscription_id = "407bb65b-f4d1-4f91-9089-f3b2c365a542"
  features {
  }
  skip_provider_registration = true
}