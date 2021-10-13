# Mock LDAP Lab

1. Show Getting Started (https://spring.io/guides/gs/authenticating-ldap/)
2. Show show app in vscode (https://github.com/spring-guides/gs-authenticating-ldap)
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

## As Is

If you wanted to run this mock-ldap project on its own, simply clone the github repo from above.  Then change to the completed directory.

You can run following command and start interactiving as is...

```bash
./mvnw spring-boot:run
ldapsearch -H ldap://localhost:8389 -b "dc=springframework,dc=org"
```
