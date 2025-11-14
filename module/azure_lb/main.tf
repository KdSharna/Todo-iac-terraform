
resource "azurerm_lb" "azure_lb" {
  for_each            = var.azure_lb
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.rg_name

  frontend_ip_configuration {
    name                 = "loadBalancerFrontEnd"
    public_ip_address_id = data.azurerm_public_ip.pip[each.key].id
  }
}
