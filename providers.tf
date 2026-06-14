terraform {
  backend "azurerm" {
    resource_group_name  = "malak-mayar-tfstate-rg"
    storage_account_name = "malakmayartfstate4693"
    container_name       = "tfstate"
    key                  = "cloudscale-project2.tfstate"
  }

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.100"
    }
  }
}

provider "azurerm" {
  features {}

  skip_provider_registration = true
}