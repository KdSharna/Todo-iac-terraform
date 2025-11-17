variable "my_bastion" {
  type = map(object({
    name        = string
    location    = string
    rg_name     = string
    subnet_name = string
    pip_name    = string
    vnet_name   = string
  }))
}
