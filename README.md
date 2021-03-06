# <ins>Infrastructure as code project, wrote in terraform</ins>

![](images/diagram.png)


## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=0.12 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~>2.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 2.99.0 |
| <a name="provider_random"></a> [random](#provider\_random) | 3.3.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_lb.applb](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/lb) | resource |
| [azurerm_lb_backend_address_pool.backendaddresspool](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/lb_backend_address_pool) | resource |
| [azurerm_lb_probe.lbbtobe](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/lb_probe) | resource |
| [azurerm_lb_rule.lbrule](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/lb_rule) | resource |
| [azurerm_linux_virtual_machine.appvm](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine) | resource |
| [azurerm_network_interface.appnic](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_interface) | resource |
| [azurerm_network_interface_backend_address_pool_association.nicbackendpool](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_interface_backend_address_pool_association) | resource |
| [azurerm_network_interface_security_group_association.appnicnsg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_interface_security_group_association) | resource |
| [azurerm_network_security_group.privatensg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_group) | resource |
| [azurerm_network_security_group.publicnsg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_group) | resource |
| [azurerm_postgresql_flexible_server.postgres](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/postgresql_flexible_server) | resource |
| [azurerm_postgresql_flexible_server_configuration.postgres_off_require_secure_transport](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/postgresql_flexible_server_configuration) | resource |
| [azurerm_private_dns_zone.postgresql](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone) | resource |
| [azurerm_private_dns_zone_virtual_network_link.postgresql](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone_virtual_network_link) | resource |
| [azurerm_public_ip.loadbalancerip](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/public_ip) | resource |
| [azurerm_resource_group.rg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |
| [azurerm_storage_account.week5storageaccount](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account) | resource |
| [azurerm_subnet.privatesubnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet) | resource |
| [azurerm_subnet.publicsubnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet) | resource |
| [azurerm_subnet_network_security_group_association.privatensg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet_network_security_group_association) | resource |
| [azurerm_subnet_network_security_group_association.publicnsg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet_network_security_group_association) | resource |
| [azurerm_virtual_network.myterraformnetwork](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network) | resource |
| [random_id.randomId](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/id) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_admin_password"></a> [admin\_password](#input\_admin\_password) | root admin password in virtual machines | `string` | `"123456789Al!"` | no |
| <a name="input_admin_username"></a> [admin\_username](#input\_admin\_username) | root admin user name in virtual machines | `string` | `"ubuntu"` | no |
| <a name="input_data_base_name"></a> [data\_base\_name](#input\_data\_base\_name) | name of db server need be exclusive name and separated '-' | `string` | `"db-serever-postgres"` | no |
| <a name="input_name_prefix"></a> [name\_prefix](#input\_name\_prefix) | Prefix of the resource name. | `string` | `"postgresqlfs"` | no |
| <a name="input_network_address"></a> [network\_address](#input\_network\_address) | network ip address spaces | `list(string)` | <pre>[<br>  "10.3.0.0/16"<br>]</pre> | no |
| <a name="input_number_of_vm"></a> [number\_of\_vm](#input\_number\_of\_vm) | n/a | `number` | `3` | no |
| <a name="input_postgresql_db_login"></a> [postgresql\_db\_login](#input\_postgresql\_db\_login) | administrator login | `string` | `"postgres"` | no |
| <a name="input_postgresql_db_password"></a> [postgresql\_db\_password](#input\_postgresql\_db\_password) | password for postgresql db | `string` | `"p@ssw0rd42"` | no |
| <a name="input_private_subnet_address"></a> [private\_subnet\_address](#input\_private\_subnet\_address) | public subnet ip address range | `list(string)` | <pre>[<br>  "10.3.2.0/24"<br>]</pre> | no |
| <a name="input_public_subnet_address"></a> [public\_subnet\_address](#input\_public\_subnet\_address) | public subnet ip address range | `list(string)` | <pre>[<br>  "10.3.1.0/24"<br>]</pre> | no |
| <a name="input_resource_group_location"></a> [resource\_group\_location](#input\_resource\_group\_location) | Location of the resource group. | `string` | `"eastus"` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | n/a | `string` | `"project"` | no |
| <a name="input_resource_group_name_prefix"></a> [resource\_group\_name\_prefix](#input\_resource\_group\_name\_prefix) | Prefix of the resource group name that's combined with a random ID so name is unique in your Azure subscription. | `string` | `"test"` | no |
| <a name="input_source_address_prefix_private_subnet_nsg_rule_postgresql"></a> [source\_address\_prefix\_private\_subnet\_nsg\_rule\_postgresql](#input\_source\_address\_prefix\_private\_subnet\_nsg\_rule\_postgresql) | source\_address\_prefix\_private\_subnet\_nsg\_rule\_postgresql | `string` | `"10.3.0.0/16"` | no |
| <a name="input_source_address_prefix_private_subnet_nsg_rule_ssh"></a> [source\_address\_prefix\_private\_subnet\_nsg\_rule\_ssh](#input\_source\_address\_prefix\_private\_subnet\_nsg\_rule\_ssh) | source\_address\_prefix\_private\_subnet\_nsg\_rule\_ssh | `string` | `"10.3.0.0/16"` | no |
| <a name="input_source_address_prefix_public_subnet_nsg_rule_ssh"></a> [source\_address\_prefix\_public\_subnet\_nsg\_rule\_ssh](#input\_source\_address\_prefix\_public\_subnet\_nsg\_rule\_ssh) | source\_address\_prefix\_public\_subnet\_nsg\_rule\_ssh | `string` | `"10.3.0.0/16"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_public_ip_address"></a> [public\_ip\_address](#output\_public\_ip\_address) | n/a |
| <a name="output_resource_group_name"></a> [resource\_group\_name](#output\_resource\_group\_name) | n/a |
| <a name="output_vms_ip"></a> [vms\_ip](#output\_vms\_ip) | n/a |
