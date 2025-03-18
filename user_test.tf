resource "keycloak_user" "test" {
  lifecycle {
    ignore_changes = [
      required_actions,
    ]
  }

  realm_id = keycloak_realm.example.id
  username = "test"
  enabled  = true

  email          = "test@example.com"
  email_verified = true
  first_name     = "Test"
  last_name      = "Example"

  initial_password {
    value     = "a"
    temporary = true
  }

  federated_identity {
    identity_provider = "SikaLabs_Training_SSO"
    user_id           = "80a62513-9540-4d3d-abeb-be79813bd69e"
    user_name         = "example_username"
  }
}

resource "keycloak_user_roles" "test" {
  realm_id = keycloak_realm.example.id
  user_id  = keycloak_user.test.id

  role_ids = [
    data.keycloak_role.default-roles-example.id,
    keycloak_role.example_viewer.id,
  ]
}
