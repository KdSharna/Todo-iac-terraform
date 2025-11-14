output "sql_database" {
  value = {
    for k, database in azurerm_mssql_database.my_sqldb : k => {
      name = database.name
      id   = database.id
      # location = data.azurerm_mssql_server.sql_server_data.location  # agar chahiye to
    }
  }
}
