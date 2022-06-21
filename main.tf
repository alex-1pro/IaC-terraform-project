# create resource group
resource "azurerm_resource_group" "rg" {
  name      = var.resource_group_name
  location  = var.resource_group_location
}

# Generate random text for a unique storage account name
resource "random_id" "randomId" {
  keepers = {
    # Generate a new ID only when a new resource group is defined
    resource_group = azurerm_resource_group.rg.name
  }

  byte_length = 8
}

# Create storage account for boot diagnostics
resource "azurerm_storage_account" "week5storageaccount" {
  account_replication_type = "LRS"
  account_tier             = "Standard"
  location                 = azurerm_resource_group.rg.location
  name                     = "diag${random_id.randomId.hex}"
  resource_group_name      = azurerm_resource_group.rg.name
}

# Create virtual machine
resource "azurerm_linux_virtual_machine" "appvm" {
  count = var.number_of_vm
  admin_username        = var.admin_username
  admin_password      = var.admin_password
  computer_name         = "${var.resource_group_name}-appVM-${count.index}"
  location              = azurerm_resource_group.rg.location
  name                  = "${var.resource_group_name}-appVM-${count.index}"
  network_interface_ids = [element(azurerm_network_interface.appnic.*.id,count.index)]
  resource_group_name   = azurerm_resource_group.rg.name
  size                  = "Standard_DS1_v2"
  disable_password_authentication = false
  os_disk {
    name                 = "${var.resource_group_name}-appOsDisk-${count.index}"
    storage_account_type = "Standard_LRS"
    caching              = "ReadWrite"
  }
  source_image_reference {

    offer     = "0001-com-ubuntu-server-focal"
    publisher = "Canonical"
    sku       = "20_04-lts-gen2"
    version   = "latest"
  }
  depends_on = [azurerm_network_interface.appnic]
  boot_diagnostics {
    storage_account_uri = azurerm_storage_account.week5storageaccount.primary_blob_endpoint
  }
}