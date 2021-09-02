# Mock LDAP Lab

1. Show Getting Started
2. Show show app in vscode
3. Show ldif file
4. Show properties file

```properties
#spring.ldap.embedded.ldif=classpath:test-server.ldif
#spring.ldap.embedded.base-dn=dc=springframework,dc=org
spring.ldap.embedded.port=8389
spring.ldap.embedded.ldif=classpath:test-server2.ldif
spring.ldap.embedded.base-dn=OU=acmeco,DC=winterfell,DC=local
spring.ldap.embedded.validation.enabled=false
```

5. Run app and query

```bash
./mvnw spring-boot:run
ldapsearch -H ldap://localhost:8389 -D "CN=service bind,OU=Users,OU=acmeco,DC=winterfell,DC=local" -w $PW -b "OU=acmeco,DC=winterfell,DC=local"
```