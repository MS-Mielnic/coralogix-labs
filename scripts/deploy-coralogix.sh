#!/usr/bin/env bash
set -euo pipefail

: "${CORALOGIX_PRIVATE_KEY:?Set CORALOGIX_PRIVATE_KEY first}"
: "${CORALOGIX_DOMAIN:?Set CORALOGIX_DOMAIN first}"
: "${CLUSTER_NAME:?Set CLUSTER_NAME first}"
: "${DEPLOYMENT_ENVIRONMENT:?Set DEPLOYMENT_ENVIRONMENT first}"

helm repo add coralogix https://cgx.jfrog.io/artifactory/coralogix-charts-virtual >/dev/null 2>&1 || true
helm repo update

kubectl create secret generic coralogix-keys   --namespace default   --from-literal=PRIVATE_KEY="${CORALOGIX_PRIVATE_KEY}"   --dry-run=client -o yaml | kubectl apply -f -

envsubst < labs/otel-demo/coralogix-values.yaml > /tmp/coralogix-values.rendered.yaml

helm upgrade --install otel-coralogix-integration   coralogix/otel-integration   --namespace default   -f /tmp/coralogix-values.rendered.yaml
