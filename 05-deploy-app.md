```bash


# show route config and mapping
bat backend/k8s/animal-rescue-backend-route-config.yaml
bat backend/k8s/animal-rescue-backend-mapping.yaml

# show backend app deployment yaml reference to jwt-set-uri
bat backend/k8s/animal-rescue-backend.yaml 

# show kubernetes securityconfiguration.java
bat backend/src/main/java/io/spring/cloud/samples/animalrescue/backend/KubernetesSecurityConfiguration.java

# show usernamejwtauthenticationconverter.java
bat backend/src/main/java/io/spring/cloud/samples/animalrescue/backend/UserNameJwtAuthenticationConverter.java

# deploy the app
kubectl create ns animal-rescue --dry-run=client -oyaml | kubectl apply -f -

kapp deploy -a animal-rescue -f backend/k8s/ -f frontend/

# check the unauthorized access works
http gateway.bearisland.tkg-vsphere-lab.winterfell.life/api/animals

kail -d animal-rescue-backend

open http://gateway.bearisland.tkg-vsphere-lab.winterfell.life/rescue



```