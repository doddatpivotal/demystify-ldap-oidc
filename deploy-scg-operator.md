[SCG4K8s Docs](https://docs.pivotal.io/scg-k8s/1-0/installation.html)

```bash
mkdir -p bin/scg4k8s
tar zxf ~/Downloads/spring-cloud-gateway-k8s-1.0.1.tgz -C bin/scg4k8s

docker login harbor.bearisland.tkg-vsphere-lab.winterfell.life -u admin -p KeepItSimple1!

# create project in harbor for scg4k8s

# run install scripts
chmod +x bin/scg4k8s/spring-cloud-gateway-k8s-1.0.1/scripts/relocate-images.sh 
./bin/scg4k8s/spring-cloud-gateway-k8s-1.0.1/scripts/relocate-images.sh harbor.bearisland.tkg-vsphere-lab.winterfell.life/scg4k8s

kubectl create ns spring-cloud-gateway

./bin/scg4k8s/spring-cloud-gateway-k8s-1.0.1/scripts/install-spring-cloud-gateway.sh spring-cloud-gateway

kubectl apply -f operator/scg-openapi-ingress.yaml 
open http://scg-openapi.bearisland.tkg-vsphere-lab.winterfell.life/openapi

```