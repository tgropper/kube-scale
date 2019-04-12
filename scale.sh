#!/bin/sh

# scale.sh {deployment} {replicas}

DEPLOYMENT_NAME=$1
REPLICAS=$2
NAMESPACE=$(cat /var/run/secrets/kubernetes.io/serviceaccount/namespace)
if [ -z "$DEPLOYMENT_NAME" ]; then "Deployment name is required" && exit 1; fi
if [ -z "$REPLICAS" ]; then REPLICAS=1; fi

curl -X PATCH -v -d '[{"op":"replace","path":"/spec/replicas","value":'"$REPLICAS"'}]' \
  --cacert /var/run/secrets/kubernetes.io/serviceaccount/ca.crt \
  -H "Authorization: Bearer $(cat /var/run/secrets/kubernetes.io/serviceaccount/token)" \
  -H "Content-Type: application/json-patch+json" \
  https://kubernetes.default.svc/apis/extensions/v1beta1/namespaces/$NAMESPACE/deployments/$DEPLOYMENT_NAME/scale