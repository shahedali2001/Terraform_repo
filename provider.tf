terraform {
    required_providers {
        azurerm = {
            source  = "hashicorp/azurerm"
            version = "~> 4.0"
        }
    }
}
provider "azurerm" {
    features {}
    subscription_id = "711f9f70-1892-49fb-a04f-5bf2c5a89677"
}
variable "rg-name" {
  type = list(string)
  default = ["mango-rg", "banana-rg", "apple-rg"]
}

resource "azurerm_resource_group" "rg-name" {
    count = length(var.rg-name)
    name     = var.rg-name[count.index]
    location = "East US"
}
