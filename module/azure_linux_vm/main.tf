resource "azurerm_network_interface" "nic" {
  for_each            = var.linux_vms
  name                = each.value.nic_name
  location            = each.value.location
  resource_group_name = each.value.rg_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.subnet[each.key].id
    private_ip_address_allocation = "Dynamic"
    # public_ip_address_id          = data.azurerm_public_ip.pip[each.key].id
  }
}
resource "azurerm_linux_virtual_machine" "linux_vms" {
  for_each                        = var.linux_vms
  name                            = each.value.vm_name
  resource_group_name             = each.value.rg_name
  location                        = each.value.location
  size                            = each.value.size
  admin_username                  = data.azurerm_key_vault_secret.vm_username[each.key].value
  admin_password                  = data.azurerm_key_vault_secret.vm_password[each.key].value
  disable_password_authentication = false

  network_interface_ids = [
  azurerm_network_interface.nic[each.key].id]

  # admin_ssh_key {
  #   username   = each.value.admin_username
  #   public_key = each.value.public_key
  # }
custom_data = base64encode(local.nginx_install)

  dynamic "os_disk" {
    for_each = each.value.os_disk
    content {
      caching              = os_disk.value.caching
      storage_account_type = os_disk.value.storage_account_type
    }
  }

  dynamic "source_image_reference" {
    for_each = each.value.source_image_reference
    content {
      publisher = source_image_reference.value.publisher
      offer     = source_image_reference.value.offer
      sku       = source_image_reference.value.sku
      version   = source_image_reference.value.version
    }
  }
}
locals {
  nginx_install = <<-EOF
    #!/bin/bash
    apt-get update -y
    apt-get install -y nginx
    systemctl enable nginx
    systemctl start nginx
  EOF
}
