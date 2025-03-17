resource "keycloak_realm" "example" {
  realm                  = "example"
  enabled                = true
  display_name           = "Example SSO"
  display_name_html      = "<h1 style=\"color: #5F673C; font-weight: bold;\">Example SSO</h1>"
  reset_password_allowed = true
  login_theme            = "training"
  smtp_server {
    host = "maildev-smtp.maildev"
    port = "25"
    from = "sso@example.com"
  }
}
