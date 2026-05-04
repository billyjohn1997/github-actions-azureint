resource "azurerm_resource_group" "rg-uks-test-01" {
  name = "rg-uks-test-01"
  location = "uksouth"

  provisioner "local-exec" {
    command = "sleep 120"
  }

}

resource "azurerm_virtual_network" "vnet-uks-test-01" {
  resource_group_name = azurerm_resource_group.rg-uks-test-01.name
  name = "vnet-uks-test-01"
  location = azurerm_resource_group.rg-uks-test-01.location
  address_space = ["10.0.0.0/16"]
  dns_servers = ["8.8.8.8", "8.8.4.4"]

  subnet {
    name = "default"
    address_prefixes = ["10.0.0.0/24"]
  }

  subnet {
    name = "Subnet1"
    address_prefixes = ["10.0.1.0/24"]
  }
  
  subnet {
    name = "Subnet2"
    address_prefixes = ["10.0.2.0/24"]
  }

}
