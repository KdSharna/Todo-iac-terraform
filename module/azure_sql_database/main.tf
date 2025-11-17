
data "azurerm_mssql_server" "sql_server_data" {
  for_each = var.my_sqldb
  name                = each.value.sql_server             # SQL Server ka naam
  resource_group_name = each.value.rg_name                  # Resource Group
}

resource "azurerm_mssql_database" "my_sqldb" {
  for_each     = var.my_sqldb
  name         = each.value.name
  server_id    = data.azurerm_mssql_server.sql_server_data[each.key].id 
  collation    = each.value.collation
  license_type = each.value.license_type
  max_size_gb  = each.value.max_size_gb
  sku_name     = each.value.sku_name
  enclave_type = each.value.enclave_type

  tags = try(each.value.tags, null)
}
