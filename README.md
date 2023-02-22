# cloud-provisioning-terraform
Demo project to Provision Azure VM with Network and Security policy using Terraform

Provisioning the following:
1. Azurerm Provider
```
provider "azurerm"
```
2. Azurerm Resource Group
```
resource "azurerm_resource_group"
```
3. Azurerm Network Security Group
```
resource "azurerm_network_security_group"
```
4. Azurerm Virtual Network
```
resource "azurerm_virtual_network"
```
5. Azurerm Subnet
```
resource "azurerm_subnet"
```
6. Azurerm Storage Container
```
resource "azurerm_storage_container"
```
7. Azurerm Storage Account
```
resource "azurerm_storage_account"
```
8. Azurerm Network Interface
```
resource "azurerm_network_interface"
```
9. Azurerm Network and Security Group Association
```
resource "azurerm_network_interface_security_group_association" 
```
