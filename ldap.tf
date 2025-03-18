resource "keycloak_ldap_user_federation" "example" {
  name     = "openldap"
  realm_id = keycloak_realm.example.id
  enabled  = true

  username_ldap_attribute = "cn"
  rdn_ldap_attribute      = "cn"
  uuid_ldap_attribute     = "objectGUID"
  user_object_classes     = ["person", "organizationalPerson", "user"]
  connection_url          = "ldap://206.81.17.1:389"
  users_dn                = "CN=Users,DC=samdom,DC=example,DC=com"
  bind_dn                 = "cn=Administrator,cn=Users,dc=samdom,dc=example,dc=com"
  bind_credential         = "Passw0rd"

  connection_timeout = "5s"
  read_timeout       = "10s"
}

resource "keycloak_ldap_group_mapper" "example" {
  realm_id                = keycloak_realm.example.id
  ldap_user_federation_id = keycloak_ldap_user_federation.example.id
  name                    = "group-mapper"

  ldap_groups_dn                 = "CN=Users,DC=samdom,DC=example,DC=com"
  group_name_ldap_attribute      = "cn"
  group_object_classes           = ["group"]
  membership_attribute_type      = "DN"
  membership_ldap_attribute      = "member"
  membership_user_ldap_attribute = "cn"
  memberof_ldap_attribute        = "memberOf"
  ignore_missing_groups          = true
}
