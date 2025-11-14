
variable "linux_vms" {
  type = map(object({
    vm_name     = string
    nic_name    = string
    location    = string
    rg_name     = string
    vnet_name   = string
    subnet_name = string
    kv_name     = string
    # pip_name    = string
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
