terraform {
  required_version = ">= 1.3.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.47.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "pintu12"
    storage_account_name = "tattu101"
    container_name       = "con99"
    key                  = "orange.terraform_state"
  }
}
provider "azurerm" {
  features {}
  subscription_id = "06f4c176-e41e-424a-bfc2-cb4b3a4e5fe5"
}
