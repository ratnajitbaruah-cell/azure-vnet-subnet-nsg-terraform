resource "azurerm_resource_group" "rg" {
  for_each = var.rg

  name     = each.value.name
  location = each.value.location
}

resource "azurerm_virtual_network" "vnet" {
  for_each = var.vnet

  name                = each.value.name
  location            = values(azurerm_resource_group.rg)[0].location
  resource_group_name = values(azurerm_resource_group.rg)[0].name
  address_space       = each.value.address_space
}

resource "azurerm_subnet" "subnet" {
  for_each = var.subnet

  name                 = each.value.name
  resource_group_name  = values(azurerm_resource_group.rg)[0].name
  virtual_network_name = values(azurerm_virtual_network.vnet)[0].name
  address_prefixes     = each.value.address_prefixes
}

resource "azurerm_network_security_group" "nsg" {
  for_each = var.nsg

  name                = each.value.name
  location            = values(azurerm_resource_group.rg)[0].location
  resource_group_name = values(azurerm_resource_group.rg)[0].name
}