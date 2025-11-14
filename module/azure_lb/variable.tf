variable "azure_lb" {
  type = map(object({
    name     = string
    location = string
    rg_name  = string
    pip_name = string
  }))
}
