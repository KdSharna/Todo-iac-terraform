
resource "azurerm_mssql_server" "sql_server" {
  for_each                     = var.sql_server
  name                         = each.value.name
  resource_group_name          = each.value.resource_group_name
  location                     = each.value.location
  version                      = each.value.version
  administrator_login          = each.value.administrator_login
  administrator_login_password = each.value.administrator_login_password
  minimum_tls_version          = each.value.minimum_tls_version

  dynamic "azuread_administrator" {
    for_each = each.value.azuread_administrator != null ? [each.value.azuread_administrator] : []
    content {
      login_username = azuread_administrator.value.login_username
       object_id      = azuread_administrator.value.object_id
    }
  }
  tags = try(each.value.tags, null)
}


