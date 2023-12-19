variable "name" {}

variable "host" {
  default = "%"
}

variable "password" {}

variable "grants" {
  type    = map(list(string))
  default = {}
}