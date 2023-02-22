resource "azurerm_virtual_network" "appvnet" {
  name                = local.virtual_network_name
  location            = local.location
  resource_group_name = local.resource_group_name
  address_space       = [local.virtual_network.address_space]


  tags = {
    environment = "Devlopement"
  }
  depends_on = [
    azurerm_resource_group.appgroup
  ]
}

resource "azurerm_subnet" "subnetA" {
  name                 = "subnetA"
  resource_group_name  = local.resource_group_name
  virtual_network_name = azurerm_virtual_network.appvnet.name
  address_prefixes     = [local.subnet[0].address_prefix]

  depends_on = [
    azurerm_virtual_network.appvnet
  ]
}

resource "azurerm_network_security_group" "appnsg" {
  name                = "appnsg"
  resource_group_name = local.resource_group_name
  location            = local.location
  security_rule {
    name                       = "rule1"
    direction                  = "Inbound"
    priority                   = 100
    protocol                   = "Tcp"
    access                     = "Allow"
    source_port_range          = "80"
    source_address_prefix      = "80"
    destination_port_ranges    = ["22", "5557"]
    destination_address_prefix = "*"

  }
  depends_on = [
    azurerm_virtual_network.appvnet
  ]


}

resource "azurerm_network_interface" "appnintf" {
  name                = "appintf"
  location            = local.location
  resource_group_name = local.resource_group_name
  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnetA.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_network_interface_security_group_association" "name" {
  network_interface_id      = azurerm_network_interface.appnintf.id
  network_security_group_id = azurerm_network_security_group.appnsg.id
}