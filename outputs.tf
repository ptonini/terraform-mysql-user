output "this" {
  value = mysql_user.this
}

output "password" {
  value = var.password == null ? random_password.this[0].result : var.password
}