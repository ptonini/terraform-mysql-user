variable "name" {}

variable "host" {
  default = "%"
}

variable "password" {
  default = null
}

variable "grants" {
  type    = map(list(string))
  default = {}
}