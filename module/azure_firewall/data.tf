# data "azurerm_subnet" "firewall_subnet" {
#   for_each = var.firewall_pip
#   name                 = each.value.subnet_name
#   virtual_network_name = each.value.vnet_name
#   resource_group_name  = each.value.rg_name
# }