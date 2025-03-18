resource "keycloak_oidc_identity_provider" "example" {
  realm             = keycloak_realm.example.id
  alias             = "SikaLabs_Training_SSO"
  authorization_url = "https://sso.sikalabs.com/realms/training/protocol/openid-connect/auth"
  client_id         = "example_client_id"
  client_secret     = "example_client_secret"
  token_url         = "https://sso.sikalabs.com/realms/training/protocol/openid-connect/token"

  extra_config = {
    "clientAuthMethod" = "client_secret_post"
  }
}
