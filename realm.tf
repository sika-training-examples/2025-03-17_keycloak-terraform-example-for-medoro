resource "keycloak_realm" "example" {
  realm                  = "example"
  enabled                = true
  display_name           = "Example SSO"
  display_name_html      = "<h1 style=\"color: #5F673C; font-weight: bold;\">Example SSO</h1>"
  reset_password_allowed = true
  login_theme            = "training"
  organizations_enabled  = true
  smtp_server {
    host = "maildev-smtp.maildev"
    port = "25"
    from = "sso@example.com"
  }
}

resource "keycloak_openid_client_scope" "example_groups" {
  realm_id               = keycloak_realm.example.id
  name                   = "groups"
  include_in_token_scope = true
}

resource "keycloak_openid_group_membership_protocol_mapper" "example_groups" {
  realm_id        = keycloak_realm.example.id
  client_scope_id = keycloak_openid_client_scope.example_groups.id

  name       = keycloak_openid_client_scope.example_groups.name
  claim_name = keycloak_openid_client_scope.example_groups.name
  full_path  = false
}
