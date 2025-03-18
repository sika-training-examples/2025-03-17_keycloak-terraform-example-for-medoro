resource "keycloak_openid_client" "example" {
  realm_id                        = keycloak_realm.example.id
  client_id                       = "example"
  client_secret                   = "example_secret"
  enabled                         = true
  standard_flow_enabled           = true
  direct_access_grants_enabled    = true
  access_type                     = "CONFIDENTIAL"
  valid_redirect_uris             = ["*"]
  valid_post_logout_redirect_uris = ["*"]
  web_origins                     = ["*"]
}

resource "keycloak_role" "example_editor" {
  realm_id  = keycloak_realm.example.id
  client_id = keycloak_openid_client.example.id
  name      = "editor"
}

resource "keycloak_role" "example_viewer" {
  realm_id  = keycloak_realm.example.id
  client_id = keycloak_openid_client.example.id
  name      = "viewer"
}

output "example_client_secret" {
  value     = keycloak_openid_client.example.client_secret
  sensitive = true
}
