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

resource "keycloak_openid_audience_protocol_mapper" "example" {
  realm_id                 = keycloak_realm.example.id
  client_id                = keycloak_openid_client.example.id
  included_client_audience = keycloak_openid_client.example.client_id
  name                     = "audience-mapper"
}

resource "keycloak_openid_client_default_scopes" "example" {
  realm_id  = keycloak_realm.example.id
  client_id = keycloak_openid_client.example.id

  default_scopes = [
    "groups",
  ]
}

resource "keycloak_openid_client_optional_scopes" "example" {
  realm_id  = keycloak_realm.example.id
  client_id = keycloak_openid_client.example.id

  optional_scopes = []
}

output "example_client_secret" {
  value     = keycloak_openid_client.example.client_secret
  sensitive = true
}
