
data "azurerm_subnet" "subnet" {
  for_each             = var.linux_vms
  name                 = each.value.subnet_name
  virtual_network_name = each.value.vnet_name
  resource_group_name  = each.value.rg_name
}
# data "azurerm_public_ip" "pip" {
#   for_each            = var.linux_vms
#   name                = each.value.pip_name
#   resource_group_name = each.value.rg_name
# }

data "azurerm_key_vault" "kv" {
  for_each = var.linux_vms
  name                = each.value.kv_name
  resource_group_name = each.value.rg_name
}

data "azurerm_key_vault_secret" "vm_username" {
  for_each = var.linux_vms
  name         = "vm-username"
  key_vault_id = data.azurerm_key_vault.kv[each.key].id
}

data "azurerm_key_vault_secret" "vm_passwords" {
  for_each = var.linux_vms
  name         = "vm-passwords"
  key_vault_id = data.azurerm_key_vault.kv[each.key].id
}