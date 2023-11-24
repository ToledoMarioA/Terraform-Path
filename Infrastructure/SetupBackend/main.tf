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
  subscription_id = ""
  features {
  }
  skip_provider_registration = true
}