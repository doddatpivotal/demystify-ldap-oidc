```bash

kubectl 

# add static client for gateway to dex, redirecturi http://gateway.bearisland.tkg-vsphere-lab.winterfell.life/login/oauth2/code/sso
      - id: gateway
        name: gateway
        secret: superSecretSecret
        redirectURIs:
          - http://gateway.bearisland.tkg-vsphere-lab.winterfell.life/login/oauth2/code/sso
# bounce dex

kubectl create ns gateway --dry-run=client -oyaml | kubectl apply -f -

bat gateway/sso-credentials.txt
kubectl create secret generic my-sso-credentials \
    --from-env-file=./gateway/sso-credentials.txt \
    --namespace=gateway \
    --dry-run=client \
    --output=yaml \
    | kubectl apply -f -

bat gateway/gateway-config.yaml
kubectl apply -f gateway/

kubectl get scg,ingress -n gateway
# wait till ready = true

```