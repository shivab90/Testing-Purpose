provider "azurerm" {}

resource "azurerm_resource_group" "network" {
  name     = "testing"
  location = "West US"
}

resource "azurerm_virtual_network" "network" {
  name                = "testing-network"
  address_space       = ["10.0.0.0/16"]
  location            = "${azurerm_resource_group.network.location}"
  resource_group_name = "${azurerm_resource_group.network.name}"
}

subnet {
  name           = "subnet1"
  address_prefix = "10.0.1.0/24"
}
