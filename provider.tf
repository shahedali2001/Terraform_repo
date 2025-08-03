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
    subscription_id = "25a58ceb-2570-42e2-9d35-00b46979c51a"
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