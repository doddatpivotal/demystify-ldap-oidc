## Setup

code ~/workspace/gs-authenticating-ldap/complete

## Browsers
https://spring.io/guides/gs/authenticating-ldap/
https://jwt.io/

will onpen in the course of the presentation
https://dex.castleblack.tkg-vsphere-lab.winterfell.life/.well-known/openid-configuration
http://gateway.bearisland.tkg-vsphere-lab.winterfell.life/rescue

## Remote Desktop
Show Active Directory
Powershell as admin
dsac.exe

## Terminals

### Tab 1 - ldapsearch

cd ~/workspace/demystify-ldap-oidc/ldapsearch
./demo.sh

### Tab 2 - test deployment

Setup terminal with 2 sessions
Terminal 1 will be for k9s
	cd ~/workspace/demystify-ldap-oidc
	kubectx castleblack-admin@castleblack
Terminal 2 will be fore logging in
	set an environment variable for KUBECONFIG as a different copy
	    export KUBECONFIG=/Users/dpfeffer/workspace/demystify-ldap-oidc/kubeconfig
		kubectx tanzu-cli-bearisland@bearisland
	remove the pinniped session 
    	rm ~/.tanzu/pinniped/sessions.yaml
	cd ~/workspace/demystify-ldap-oidc


### Tab 3 - mock ldap
cd ~/workspace/demystify-ldap-oidc


## Reset

```bash

# reset management cluster
kubectl config use-context castleblack-admin@castleblack

# remove client from dex config map
kubectl edit cm dex -n tanzu-system-auth

kubectl rollout restart deployment dex -n tanzu-system-auth

# reset workload cluster
kubectl config use-context bearisland-admin@bearisland

# delete anmical rescue namespace
kubectl delete ns animal-rescue

# remove delete gateway namespace
kubectl delete ns gateway


rm ~/.tanzu/pinniped/sessions.yaml

```
