# variable "my_nsg" {
#   type = map(object({
#     name                = string
#     location            = string
#     resource_group_name = string

#     security_rule = list(object({
#       name                       = string
#       priority                   = number
#       direction                  = string
#       access                     = string
#       protocol                   = string
#       source_port_range          = string
#       destination_port_range     = list(string)
#       source_address_prefix      = string
#       destination_address_prefix = string

#     }))
#   }))
# }
