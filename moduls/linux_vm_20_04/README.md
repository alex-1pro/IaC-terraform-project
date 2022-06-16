## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_linux_virtual_machine.appvm](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_admin_password"></a> [admin\_password](#input\_admin\_password) | admin password | `string` | n/a | yes |
| <a name="input_admin_username"></a> [admin\_username](#input\_admin\_username) | admin user name | `string` | n/a | yes |
| <a name="input_azure_storage_account"></a> [azure\_storage\_account](#input\_azure\_storage\_account) | example: storage\_account\_uri = azurerm\_storage\_account.week5storageaccount.primary\_blob\_endpoint | `string` | n/a | yes |
| <a name="input_caching"></a> [caching](#input\_caching) | ReadWrite | `string` | n/a | yes |
| <a name="input_computer_name"></a> [computer\_name](#input\_computer\_name) | name of computer | `string` | n/a | yes |
| <a name="input_depends_onv"></a> [depends\_onv](#input\_depends\_onv) | azurerm\_network\_interface it list | `list()` | n/a | yes |
| <a name="input_disable_password_authentication"></a> [disable\_password\_authentication](#input\_disable\_password\_authentication) | disable password authentication | `bool` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | location of resource group | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | name | `string` | n/a | yes |
| <a name="input_network_interface_ids"></a> [network\_interface\_ids](#input\_network\_interface\_ids) | network interface ids | `list()` | n/a | yes |
| <a name="input_num_vms"></a> [num\_vms](#input\_num\_vms) | number of vms | `number` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | name of resource group | `string` | n/a | yes |
| <a name="input_size_vm"></a> [size\_vm](#input\_size\_vm) | size of vm , like Standard\_DS1\_v2 | `string` | n/a | yes |
| <a name="input_storage_account_type"></a> [storage\_account\_type](#input\_storage\_account\_type) | storage\_account\_type example: Standard\_LRS | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_admin_password"></a> [admin\_password](#output\_admin\_password) | n/a |
| <a name="output_admin_username"></a> [admin\_username](#output\_admin\_username) | n/a |
| <a name="output_caching"></a> [caching](#output\_caching) | n/a |
| <a name="output_computer_name"></a> [computer\_name](#output\_computer\_name) | n/a |
| <a name="output_depends_on"></a> [depends\_on](#output\_depends\_on) | n/a |
| <a name="output_location"></a> [location](#output\_location) | n/a |
| <a name="output_name"></a> [name](#output\_name) | n/a |
| <a name="output_resource_group_name"></a> [resource\_group\_name](#output\_resource\_group\_name) | n/a |
| <a name="output_size_vm"></a> [size\_vm](#output\_size\_vm) | n/a |
| <a name="output_storage_account_type"></a> [storage\_account\_type](#output\_storage\_account\_type) | n/a |
