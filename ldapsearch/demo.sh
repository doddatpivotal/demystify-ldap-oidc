#!/bin/bash
. demo-magic.sh
clear

HOST=ldap://192.168.7.116:389
BIND_USER=servicebind@winterfell.local

echo "Let's checkout ldapsearch help options"
pe "ldapsearch --help"
wait
clear

echo "Initial query of the directory.  Could be thousands of results, better limit search"
pe "ldapsearch -H ldap://192.168.7.116:389 -D \"servicebind@winterfell.local\" -w \$PW -b \"dc=winterfell,dc=local\" -z 10"
wait
clear

echo "Let's look for a user, you are familiar with.  Yourself."
pe "ldapsearch -H \$HOST -D \$BIND_USER -w \$PW -b \"dc=winterfell,dc=local\" -z 10 \"(cn=Dodd Pfeffer)\""
wait

echo "Can we find user search base dn, user search filter, and user name?"
wait


echo "Can we find group references?"
wait

# Now I see that I'm in an OU called Users.  That's pretty common.  Sometimes I see Global Users or something like that.  So lets go with that.
#  LDAP_USER_SEARCH_BASE_DN: OU=Users,OU=acmeco,DC=winterfell,DC=local
# I also see that my record has several object classes.  person is a common one for user accounts, so I'll go with that too.
#  LDAP_USER_SEARCH_FILTER: (objectclass=person)
# I see my userid is in a field called sAMAccountName.  That is common for active directory.  For others, it may be uid
#  LDAP_USER_SEARCH_USERNAME: sAMAccountName

clear
echo "Query for a group which I am a member of"
pe "ldapsearch -H \$HOST -D \$BIND_USER -w \$PW -b \"OU=Groups,OU=acmeco,DC=winterfell,DC=local\" \"(CN=platform-team)\""
wait
echo "Can we find group search base dn, group search filter, and group name and membership attribute?"
wait