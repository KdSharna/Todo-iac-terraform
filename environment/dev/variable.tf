variable "name_rg" {
  type = map(object({
    name     = string
    location = string

    tags = optional(map(string))
  }))
}

variable "nw_virtual" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    address_space       = list(string)
    dns_servers         = list(string)
    subnet = map(object({
      name             = string
      address_prefixes = list(string)
    }))
  }))
}

variable "pip_engress" {
  type = map(object({
    name                = string
    resource_group_name = string
    location            = string
    allocation_method   = string
    tags                = optional(map(string))
  }))
}

variable "server_sql" {
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

variable "sqldb" {
  type = map(object({
    name         = string
    server_id    = optional(string)
    collation    = string
    license_type = string
    max_size_gb  = number
    sku_name     = string
    enclave_type = string
    rg_name =string
    sql_server=string
    tags         = optional(map(string))
  }))
}

# variable "kd_firewall" {
#   type = map(object({
#     name     = string
#     location = string
#     rg_name  = string
#     sku_name = string
#     sku_tier = string
# subnet_name =string
#     ip_configuration = map(object({
#       name      = string
#       subnet_id = optional(string)
#     }))
#     tags = optional(map(string))
#   }))
# }

variable "vms" {
  type = map(object({
    vm_name        = string
    nic_name       = string
    location       = string
    rg_name        = string
    vnet_name      = string
    kv_name        = string
    subnet_name    = string
    # pip_name       = string
    size           = string
    admin_username = string
    admin_password = string
    # public_key     = string

    source_image_reference = map(object({
      publisher = string
      offer     = string
      sku       = string
      version   = string
    }))
    os_disk = map(object({
      caching              = string
      storage_account_type = string
    }))
  }))
}

variable "vault_keys" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    sku_name            = string
  }))
}

# variable "lb_azure" {
#   type = map(object({
#     name     = string
#     location = string
#     rg_name  = string
#     pip_name = string
#   }))
# }

variable "bastion_my" {
  type = map(object({
    name        = string
    location    = string
    rg_name     = string
    subnet_name = string
    pip_name    = string
    vnet_name   = string
  }))
}
# variable "nsg_my" {
#   type = map(object({
#     name                = string
#     location            = string
#     resource_group_name = string

#     security_rule = list(object({
#       name                       = string
#       priority                   = number
#       direction                  = string
#       access                     = string
#       protocol                   = string
#       source_port_range          = string
#       destination_port_ranges     = list(string)
#       source_address_prefix      = string
#       destination_address_prefix = string

#     }))
#   }))
# }
# variable "azure_lb" {
#   type = map(object({
#     lb_name     = string
#     location = string
#     rg_name  = string
#     pip_name = string

#   }))
# }
# variable "lb_rule" {
#   type = map(object({
# lb_name =string
# resource_group_name =string
# protocol= string
# frontend_port=number
# backend_port=number
# frontend_ip_configuration= string
# }))
# }

# variable "lb_pool" {
#   type = map(object({
#     lb_name = string
#   }))
# }

# variable "lb_probe" {
#   type = map(object({
#     lb_name = string
#     port    = number
#   }))
# }