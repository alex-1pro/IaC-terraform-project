variable "resource_group_name_prefix" {
  default     = "test"
  description = "Prefix of the resource group name that's combined with a random ID so name is unique in your Azure subscription."
}

variable "resource_group_name" {
  default = "project"
}


variable "resource_group_location" {
  default     = "eastus"
  description = "Location of the resource group."
}

variable "name_prefix" {
  default     = "postgresqlfs"
  description = "Prefix of the resource name."
}

variable "number_of_vm" {
  type    = number
  default = 3
}

variable "admin_username" {
  type    = string
  default = "ubuntu"
}

variable "admin_password" {
  type    = string
  default = "123456789Al!"
}
variable "network_address" {
  type        = list(string)
  description = "network ip address spaces"
  default     = ["10.3.0.0/16"]
}
variable "public_subnet_address" {
  type        = list(string)
  description = "public subnet ip address range"
  default     = ["10.3.1.0/24"]

}

variable "private_subnet_address" {
  type        = list(string)
  description = "public subnet ip address range"
  default     = ["10.3.2.0/24"]
}

variable "data_base_name" {
  type = string
  description = "name of db server need be exclusive name and separated '-'"
  default = "db-serever-postgres"
}