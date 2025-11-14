output "sql_server" {
  value = {
    for k, server in azurerm_mssql_server.sql_server : k => {
      name     = server.name
      location = server.location
      id       = server.id
    }
  }
}