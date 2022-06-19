
# Enables you to manage Private DNS zones within Azure DNS
resource "azurerm_private_dns_zone" "postgresql" {
  name                = "postgresql.postgres.database.azure.com"
  resource_group_name = azurerm_resource_group.rg.name

  depends_on = [azurerm_subnet_network_security_group_association.privatensg]
}
#
resource "azurerm_private_dns_zone_virtual_network_link" "postgresql" {
  name                = "postgresqlVnetZone.com"
  resource_group_name = azurerm_resource_group.rg.name
  private_dns_zone_name = azurerm_private_dns_zone.postgresql.name
  virtual_network_id = azurerm_virtual_network.myterraformnetwork.id
}
#
resource "azurerm_postgresql_flexible_server" "postgres" {
  location               = azurerm_resource_group.rg.location
  name                   = var.data_base_name
  resource_group_name    = azurerm_resource_group.rg.name
  version                = "13"
  delegated_subnet_id    = azurerm_subnet.privatesubnet.id
  private_dns_zone_id    = azurerm_private_dns_zone.postgresql.id
  administrator_login    = "postgres"
  administrator_password = "p@ssw0rd42"
  zone                   = "1"
  storage_mb             = 32768

  sku_name               = "B_Standard_B1ms"

  backup_retention_days  = 7
  depends_on = [azurerm_private_dns_zone_virtual_network_link.postgresql]
}

resource "azurerm_postgresql_flexible_server_configuration" "postgres_off_require_secure_transport" {
  name      = "require_secure_transport"
  server_id = azurerm_postgresql_flexible_server.postgres.id
  value     = "off"
}

