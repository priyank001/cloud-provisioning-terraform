locals {
  resource_group_name         = "appgroup"
  network_security_group_name = "appnetworkgroup"
  storage_account_name        = "priyankstorage4321"
  location                    = "East US"
  virtual_network_name        = "appvnet"
  virtual_network = {
    name          = "app-network"
    address_space = "10.0.0.0/16"
  }
  subnet = [{
    name           = "subnet1"
    address_prefix = "10.0.0.0/24"
    },
    {
      name           = "subnet2"
      address_prefix = "10.0.1.0/24"

  }]
}