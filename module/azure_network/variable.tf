variable "virtual_nw" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    address_space       = list(string)
    dns_servers         = list(string)
    
    subnet = map(object({
      name             = string
      address_prefixes = list(string)
    }))
  }))
}
