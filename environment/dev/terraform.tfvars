name_rg = {
  rg1 = {
    name     = "pintu"
    location = "east us2"
    tags = {
      environment = "deployment"
      cost_center = "eric"
    }
  }
  # rg2 = {
  #   name     = "chintu"
  #   location = "centralindia"
  # }
}

nw_virtual = {
  "vnet1" = {
    name                = "pintu_vnet"
    location            = "east us2"
    resource_group_name = "pintu"
    address_space       = ["10.0.0.0/16"]
    dns_servers         = ["10.0.0.4", "10.0.0.5"]

    subnet = {
      fe_subnet = {
        name             = "vicky_subnet"
        address_prefixes = ["10.0.1.0/24"]
      }
      be_subnet = {
        name             = "kd_subnet"
        address_prefixes = ["10.0.2.0/24"]
      }
      firewall_subnet = {
        name             = "AzureFirewallSubnet"
        address_prefixes = ["10.0.3.0/24"]
      }
    }
  }
}

pip_engress = {
  fe_pip = {
    name                = "frontend_pip"
    location            = "east us2"
    resource_group_name = "pintu"
    allocation_method   = "Static"
    tags = {
      cost_center = "self"
      purpose     = "public"
    }
  }
  be_pip = {
    name                = "backend_pip"
    location            = "east us2"
    resource_group_name = "pintu"
    allocation_method   = "Static"
  }
}

server_sql = {
  server = {
    name                         = "sqlmayserver"
    location                     = "east us2"
    resource_group_name          = "pintu"
    version                      = "12.0"
    administrator_login          = "tondu_admin"
    administrator_login_password = "T0ndu!@#2025"
    minimum_tls_version          = "1.2"

    azuread_administrator = {
      login_username = "Rahul@vanscatestgmail.onmicrosoft.com"
      object_id      = "1e8ce925-3638-4017-97e8-ddd569794f24"
    }
    tags = {
      environment  = "dev"
      owner        = "devops_team"
      project      = "sql-modernization"
      costcenter   = "CC-1023"
      businessunit = "finance"
    }
  }
}

sqldb = {
  dbsql = {
    name = "kds-sql"
    # server_id    = module.server_sql.server_ids["server"]
    collation    = "SQL_Latin1_General_CP1_CI_AS"
    license_type = "LicenseIncluded"
    max_size_gb  = 2
    sku_name     = "S0"
    enclave_type = "VBS"

    tags = {
      environment         = "dev"
      owner               = "devops_team"
      project             = "sql-modernization"
      costcenter          = "CC-1023"
      businessunit        = "finance"
      created_by          = "terraform"
      data_classification = "confidential"
    }
  }
}

# kd_firewall = {
#   "fe_pip1" = {
#     name        = "testing_firewall"
#     location    = "east us2"
#     rg_name     = "pintu"
#     sku_name    = "AZFW_VNet"
#     sku_tier    = "Standard"
#     subnet_name = "AzureFirewallSubnet"

#     ip_configuration = {
#       "ipconfig1" = {
#         name               = "fw-ipconfig"
#         private_ip_address = "10.0.0.4"
#       }
#     }
#     tags = {
#       security_zone           = "perimeter"
#       inspection_mode         = "threat-protection"
#       log_analytics_workspace = "law-prod-eastus2"
#       policy_version          = "v2.3.1"
#       update_window           = "saturday-0200-0400"
#       zone_redundancy         = "enabled"
#     }

#   }
# }

vms = {
  vm1 = {
    vm_name     = "fevm"
    nic_name    = "fe_nic"
    location    = "east us2"
    rg_name     = "pintu"
    vnet_name   = "pintu_vnet"
    subnet_name = "vicky_subnet"
    kv_name     = "my-secrete01"
    # pip_name       = "frontend_pip"
    size           = "Standard_F2"
    admin_username = "vm-username"
    admin_password = "vm-passwords"
    # public_key     = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDtUmYaaoeA5581ehGFZ/u4OpuV6PIcQNZU1Wl6nCcsq7RKHKwWTDVBq8+wASOOP+xa6iFnhJYtJhcza3D4GBjYXlpan7++B2Qx65sBE6UsqldaTyMzxMtONpcmEdWV0BVblW0PGpXTmtyA0e6xg1IRnkCLHfLalumlU9KOPpB6DuXn2ouVfmqqFbJA521Mcn9DaNLqPnTV9nJwt8/FVC1OvpZzJ4yvuOOUixkfYm0An6aYRynep+tvrgAdFSvJmcWKLly/IL6tyX1r4oHDeC5buxlMK2QaSIli/Wgi30rhYgh+XuUV/ufjHfoRb8JkKpJ0VqHyKT+KmmQ1eZsXNfXyyWD0adscMEkn/u4qKCdhW85qPhQqGOPyf48BUOezd6vPxqja065AY0HyI9nOj05OdbNMPODav6usxtOmVuJAWQeSEcER9cnfvVzp1+2a4zeIwGsAd+JxWNcSnIYn2DvwK79KjQtGD75c0mrwCVV7oeHHzpIX1bfln3DPZbqd8DDseES6QrfegzOlHXFZXiIXjKRw5HyG2ykk9i5FqmXFOU5AFfegELf2qpU99qwKgNl7sVL4MDjj5co9qDQkN+UulGKcN6Qp7qAn7VXQNOfySL2rFfC9KFp+JhN4xuJG2h/Y+8KiC378tvjCwC4Oy2WZBKqKsnD/UABAPdcvMb9EXQ== kapil@LAPTOP-6KILMVK3"
    source_image_reference = {
      image1 = {
        publisher = "Canonical"
        offer     = "0001-com-ubuntu-server-jammy"
        sku       = "22_04-lts"
        version   = "latest"
      }
    }
    os_disk = {
      disk1 = {
        caching              = "ReadWrite"
        storage_account_type = "Standard_LRS"
      }
    }
  }
}

vault_keys = {
  "keys" = {
    name                = "my-secrete01"
    location            = "east us2"
    resource_group_name = "pintu"
    sku_name            = "standard"
  }
}

lb_azure = {
  lb = {
    name     = "fe_lb"
    location = "east us2"
    rg_name  = "pintu"
    pip_name = "frontend_pip"
  }
}
