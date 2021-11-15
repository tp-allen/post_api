terraform {

  required_version = "1.0.0"

  backend "azurerm" {
    resource_group_name  = ""
    storage_account_name = ""
    container_name       = ""
    key                  = "timeapp${var.envname}/terraform.tfstate"
  }
  
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "2.65.0"
    }
  }

}

provider "azurerm" {
  subscription_id = ""
  features {}
}
