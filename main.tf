terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.43.0"
    }
  }
}

provider "azurerm" {
  # Configuration options
  features {}
}


resource "azurerm_resource_group" "appgroup" {
  name     = local.resource_group_name
  location = local.location
}

resource "azurerm_network_security_group" "appnetworkgroup" {
  name                = local.network_security_group_name
  location            = local.location
  resource_group_name = local.resource_group_name
  depends_on = [
    azurerm_resource_group.appgroup
  ]
}

# resource "azurerm_virtual_network" "appvnet" {
#   name                = local.virtual_network_name
#   location            = local.location
#   resource_group_name = local.resource_group_name
#   address_space       = local.virtual_network.address_space


#   subnet {
#     name           = "subnet1"
#     address_prefix = "10.0.0.0/24"
#   }

#   subnet {
#     name           = "subnet2"
#     address_prefix = "10.0.1.0/24"
#     security_group = azurerm_network_security_group.example.id
#   }

#   tags = {
#     environment = "Production"
#   }

# }

resource "azurerm_storage_container" "data" {
  count = 3
  name = "data${count.index}"
  storage_account_name = local.storage_account_name
  container_access_type = "blob"
    # depends_on = [
    #   azurerm_storage_account.storage_account_name
    # ]

}
resource "azurerm_storage_account" "priyankstorage4321" {
  name                     = local.storage_account_name
  resource_group_name      = local.resource_group_name
  location                 = local.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  depends_on = [
    azurerm_resource_group.appgroup
  ]
}
# resource "azurerm_storage_container" "data" {
#   for_each              = toset(["dog", "cat", "monkey", "saand"])
#   name                  = each.key
#   storage_account_name  = local.storage_account_name
#   container_access_type = "blob"
#   depends_on = [
#     azurerm_storage_account.priyankstorage4321
#   ]
# }