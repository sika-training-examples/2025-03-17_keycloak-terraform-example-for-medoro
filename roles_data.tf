data "keycloak_role" "realm-admin" {
  realm_id  = keycloak_realm.example.id
  client_id = data.keycloak_openid_client.realm-management.id
  name      = "realm-admin"
}

data "keycloak_role" "default-roles-example" {
  realm_id = keycloak_realm.example.id
  name     = "default-roles-example"
}
