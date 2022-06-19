output "resource_group_name" {
    value = azurerm_resource_group.rg.name
}

output "public_ip_address" {
    #value = azurerm_linux_virtual_machine.appvm[*].public_ip_address
    value = azurerm_public_ip.loadbalancerip.id
}

output "vms_ip" {
    value = azurerm_linux_virtual_machine.appvm[*].private_ip_address
}
