data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "keys_vault" {
  for_each                    = var.keys_vault
  name                        = each.value.name
  location                    = each.value.location
  resource_group_name         = each.value.resource_group_name
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false

  sku_name = each.value.sku_name

  # access_policy {
  #   tenant_id = data.azurerm_client_config.current.tenant_id
  #   object_id = data.azurerm_client_config.current.object_id

  #   key_permissions = ["Get", "Delete", "Get"]

  #   secret_permissions = ["Set", "Get", "Delete", "Purge", "Recover"]

  #   storage_permissions = ["Get", "List", "Delete"]
  # }
}
