#!/usr/bin/env bash
set -euo pipefail

helm repo add open-telemetry https://open-telemetry.github.io/opentelemetry-helm-charts >/dev/null 2>&1 || true
helm repo update

kubectl create namespace demo --dry-run=client -o yaml | kubectl apply -f -

helm upgrade --install otel-demo   open-telemetry/opentelemetry-demo   --namespace demo   -f labs/otel-demo/otel-demo-overrides.yaml
