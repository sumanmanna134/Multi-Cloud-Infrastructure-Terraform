variable "public_key" {
  type      = string
  sensitive = true

}

variable "tags" {
  type = map(string)

}
