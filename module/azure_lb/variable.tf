# variable "azure_lb" {
#   type = map(object({
#     lb_name     = string
#     location = string
#     rg_name  = string
#     pip_name = string

#   }))
# }
# variable "lb_rule" {
#   type = map(object({
# lb_name =string
# resource_group_name =string
# protocol= string
# frontend_port=number
# backend_port=number
# frontend_ip_configuration= string
# }))
# }

# variable "lb_pool" {
#   type = map(object({
#     lb_name = string
#   }))
# }

# variable "lb_probe" {
#   type = map(object({
#     lb_name = string
#     port    = number
#   }))
# }