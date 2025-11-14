resource "azurerm_resource_group" "rg_name" {
  for_each = var.rg_name
  name     = each.value.name
  location = each.value.location
  tags     = try(each.value.tags, null)
}
