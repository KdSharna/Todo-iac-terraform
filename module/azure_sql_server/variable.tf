variable "sql_server" {
  type = map(object({
    name                         = string
    resource_group_name          = string
    location                     = string
    version                      = string
    administrator_login          = string
    administrator_login_password = string
    minimum_tls_version          = string

    azuread_administrator = optional(object({
      login_username = string
      object_id      = string
    }))
    tags = optional(map(string))
  }))
}

