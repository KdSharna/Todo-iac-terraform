# data "azurerm_public_ip" "pip" {
#     for_each = var.azure_lb
#   name                = each.value.pip_name
#   resource_group_name = each.value.rg_name
# }
