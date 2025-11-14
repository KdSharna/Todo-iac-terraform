output "engress_pip" {
  value = {
    for k, pip in azurerm_public_ip.engress_pip : k => {
      name     = pip.name
      location = pip.location
      id       = pip.id
    }
  }
}
