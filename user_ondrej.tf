resource "keycloak_user" "ondrej" {
  lifecycle {
    ignore_changes = [
      required_actions,
      federated_identity,
    ]
  }

  realm_id = keycloak_realm.example.id
  username = "ondrej"
  enabled  = true

  email          = "ondrej@example.com"
  email_verified = true
  first_name     = "Ondrej"
  last_name      = "Sika"

  initial_password {
    value     = "a"
    temporary = true
  }
}

resource "keycloak_user_roles" "ondrej" {
  realm_id = keycloak_realm.example.id
  user_id  = keycloak_user.ondrej.id

  role_ids = [
    data.keycloak_role.default-roles-example.id,
    data.keycloak_role.realm-admin.id,
    keycloak_role.editor.id,
    keycloak_role.example_editor.id,
  ]
}
