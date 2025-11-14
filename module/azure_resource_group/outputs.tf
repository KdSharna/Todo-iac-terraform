output "rg_name" {
  value = {
    for k, rg in azurerm_resource_group.rg_name : k => {
      name     = rg.name
      location = rg.location
      id       = rg.id
    }
  }
}
