# output "firewall_pip" {
#   value = {
#     for k, firewall in azurerm_firewall.firewall_pip : k => {
#       name     = firewall.name
#       location = firewall.location
#       id       = firewall.id
#     }
#   }
# }