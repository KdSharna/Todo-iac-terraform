output "virtual_networks" {
  value = {
    for k, vnet in azurerm_virtual_network.virtual_nw : k => {
      name     = vnet.name
      id       = vnet.id
      location = vnet.location
    }
  }
}
