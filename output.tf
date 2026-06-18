output "resource_group_name" {
  value = values(azurerm_resource_group.rg)[0].name
}

output "vnet_name" {
  value = values(azurerm_virtual_network.vnet)[0].name
}

output "subnet_name" {
  value = values(azurerm_subnet.subnet)[0].name
}

output "nsg_name" {
  value = values(azurerm_network_security_group.nsg)[0].name
}