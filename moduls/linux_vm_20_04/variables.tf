variable "num_vms" {
  type = number
  description = "number of vms"
}

variable "admin_username" {
  type = string
  description = "admin user name"
}

variable "admin_password" {
  type = string
  description = "admin password"
}

variable "computer_name" {
  type = string
  description = "name of computer"
}

variable "location" {
  type = string
  description = "location of resource group"
}

variable "name" {
  type = string
  description = "name"
}

variable "network_interface_ids" {
  type = list()
  description = "network interface ids "
}

variable "resource_group_name" {
  type = string
  description = "name of resource group"
}

variable "size_vm" {
  type = string
  description = "size of vm , like Standard_DS1_v2"
}

variable "disable_password_authentication" {
  type = bool
  description = "disable password authentication"
}

variable "depends_onv" {
  type = list()
  description = "azurerm_network_interface it list"
}

variable "azure_storage_account" {
  type = string
  description = "example: storage_account_uri = azurerm_storage_account.week5storageaccount.primary_blob_endpoint"

}

variable "storage_account_type" {
  type = string
  description = "storage_account_type example: Standard_LRS"
}

variable "caching" {
  type = string
  description = "ReadWrite"
}