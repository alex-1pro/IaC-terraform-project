output "resource_group_name" {
    value = azurerm_resource_group.rg.name
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