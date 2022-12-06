resource "random_password" "this" {
  count   = var.password == null ? 1 : 0
  length  = 16
  special = false
}

resource "mysql_user" "this" {
  provider           = mysql
  user               = var.name
  host               = var.host
  plaintext_password = try(random_password.this[0].result, var.password)
}

resource "mysql_grant" "this" {
  provider   = mysql
  for_each   = var.grants
  host       = var.host
  user       = mysql_user.this.user
  database   = each.key
  privileges = each.value
  grant      = true
}