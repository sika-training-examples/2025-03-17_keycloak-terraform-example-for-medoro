data "keycloak_openid_client" "realm-management" {
  realm_id  = keycloak_realm.example.id
  client_id = "realm-management"
}
