resource "mysql_user" "this" {
  provider           = mysql
  user               = var.name
  host               = var.host
  plaintext_password = var.password
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