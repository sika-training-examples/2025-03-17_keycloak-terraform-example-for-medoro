variable "google_client_secret" {
  type = string
}

resource "keycloak_oidc_google_identity_provider" "example" {
  realm         = keycloak_realm.example.id
  client_id     = "680858277426-hbsbhkd08ldc6kvnt9roj8jrp1cftp3n.apps.googleusercontent.com"
  client_secret = var.google_client_secret
  trust_email   = true
  sync_mode     = "IMPORT"
}
