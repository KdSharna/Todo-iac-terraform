variable "rg_name" {
  type = map(object({
    name     = string
    location = string

    tags = optional(map(string))
  }))
}
