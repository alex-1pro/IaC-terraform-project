output "resource_group_name" {
    value = azurerm_resource_group.rg.name
}

output "resource_group_location" {
    value = azurerm_resource_group.rg.location
}

output "azurerm_subnet_publicsubnet_id" {
    value = azurerm_subnet.publicsubnet.id
}
output "azurerm_subnet_publicsubnet_name" {
    value = azurerm_subnet.publicsubnet.name
}

output "azurerm_subnet_privatesubnet_name" {
    value = azurerm_subnet.privatesubnet.name
}

output "public_ip_address" {
    value = azurerm_public_ip.loadbalancerip.ip_address
}

output "vms_ip" {
    value = azurerm_linux_virtual_machine.appvm[*].private_ip_address
}

output "vm_admin_password" {
    value = azurerm_linux_virtual_machine.appvm[*].admin_password
    sensitive = true
}

output "virtual_network_name" {
    value = azurerm_virtual_network.myterraformnetwork.name
}
output "virtual_network_id" {
    value = azurerm_virtual_network.myterraformnetwork.id
}
