

output "resource_group_name" {
  value = azurerm_linux_virtual_machine.appvm.resource_group_name
}

output "location" {
  value = azurerm_linux_virtual_machine.appvm.location
}

output "admin_username" {
  value = azurerm_linux_virtual_machine.appvm.admin_username

}

output "admin_password" {
  value =azurerm_linux_virtual_machine.appvm.admin_password
  sensitive = true
}

output "computer_name" {
  value = azurerm_linux_virtual_machine.appvm.computer_name
}

output "name" {
  value = azurerm_linux_virtual_machine.appvm.name
}




output "size_vm" {
  value = azurerm_linux_virtual_machine.appvm.size
}


output "depends_on" {
 value = azurerm_linux_virtual_machine.appvm[*].depends_on
}



output "storage_account_type" {
  value = azurerm_linux_virtual_machine.appvm.os_disk[1].storage_account_type
}

output "caching" {
 value = azurerm_linux_virtual_machine.appvm.os_disk[2].caching
}



