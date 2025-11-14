# variable "firewall_pip" {
#   type = map(object({
#     name     = string
#     location = string
#     rg_name  = string
#     sku_name = string
#     sku_tier = string

#     ip_configuration = map(object({
#       name      = string
#       subnet_id = optional(string)

#     }))
#     tags = optional(map(string))
#   }))
# }
