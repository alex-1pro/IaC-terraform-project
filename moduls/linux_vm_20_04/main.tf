# Create virtual machine
resource "azurerm_linux_virtual_machine" "appvm" {
  count = var.num_vms
  admin_username        = var.admin_username
  admin_password      = var.admin_password
  computer_name         = "${var.computer_name}-${count.index}"
  location              = var.location
  name                  = "${var.name}-${count.index}"
  network_interface_ids = [element(var.network_interface_ids,count.index)]
  resource_group_name   = var.location
  size                  = var.size_vm
  disable_password_authentication = var.disable_password_authentication
  os_disk {
    name                 = "${var.name}OsDisk-${count.index}"
    storage_account_type = var.storage_account_type
    caching              = var.caching
  }
  source_image_reference {

    offer     = "0001-com-ubuntu-server-focal"
    publisher = "Canonical"
    sku       = "20_04-lts-gen2"
    version   = "latest"
  }
  depends_on = [var.depends_onv]
  boot_diagnostics {
    storage_account_uri = var.azure_storage_account
  }
}