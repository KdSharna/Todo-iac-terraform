
# resource "azurerm_firewall" "firewall_pip" {
#   for_each            = var.firewall_pip
#   name                = each.value.name
#   location            = each.value.location
#   resource_group_name = each.value.rg_name
#   sku_name            = each.value.sku_name
#   sku_tier            = each.value.sku_tier

#   dynamic "ip_configuration" {
#       for_each = each.value.ip_configuration
#     content {
#       name               = ip_configuration.value.name
#       subnet_id          = data.azurerm_subnet.firewall_subnet[each.key].id
#     }
#   }
#   tags = try(each.value.tags, null)
# }


