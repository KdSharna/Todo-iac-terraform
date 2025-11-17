resource "azurerm_bastion_host" "my_bastion" {
  for_each            = var.my_bastion
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.rg_name

  ip_configuration {
    name                 = "configuration"
    subnet_id            = data.azurerm_subnet.subnet[each.key].id
    public_ip_address_id = data.azurerm_public_ip.pip[each.key].id
  }
}

