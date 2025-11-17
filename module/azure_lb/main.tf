
# resource "azurerm_lb" "azure_lb" {
#   for_each            = var.azure_lb
#   name                = each.value.lb_name
#   location            = each.value.location
#   resource_group_name = each.value.rg_name

#   frontend_ip_configuration {
#     name                 = "loadBalancerFrontEnd"
#     public_ip_address_id = data.azurerm_public_ip.pip[each.key].id
#   }
# }

# resource "azurerm_lb_nat_rule" "lb_rule" {
#   for_each = var.lb_rule
#   resource_group_name            = each.value.resource_group_name
#   loadbalancer_id                = azurerm_lb.azure_lb[each.value.lb_name].id
#   name                           = each.value.name
#   protocol                       = each.value.protocol
#   frontend_port                  = each.value.frontend_port
#   backend_port                   = each.value.backend_port
#   frontend_ip_configuration_name = each.value.frontend_ip_configuration
# }

# resource "azurerm_lb_backend_address_pool" "lb_pool" {
#   for_each = var.lb_pool
#   loadbalancer_id = azurerm_lb.azure_lb[each.value.lb_name].id
#   name            = each.value.name
# }

# resource "azurerm_lb_probe" "lb_probe" {
# for_each = var.lb_probe
#   loadbalancer_id = azurerm_lb.azure_lb[each.value.lb_name].id
#   name            = each.value.name
#   port            = each.value.port
# }