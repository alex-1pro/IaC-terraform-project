variable "resource_group_name_prefix" {
  default       = "project"
  description   = "Prefix of the resource group name that's combined with a random ID so name is unique in your Azure subscription."
}

variable "resource_group_name" {
  default = "project"
}


variable "resource_group_location" {
  default = "eastus"
  description   = "Location of the resource group."
}

variable "name_prefix" {
  default     = "postgresqlfs"
  description = "Prefix of the resource name."
}

variable "number_of_vm" {
  type = number
  default = 3
}

variable "admin_username" {
  type = string
  default = "ubuntu"
}

variable "admin_password" {
  type = string
  default = "123456789Al!"
}
