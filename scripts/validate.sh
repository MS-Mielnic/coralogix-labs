#!/usr/bin/env bash
set -euo pipefail

echo "== Coralogix components =="
kubectl get pods -n default | grep -i coralogix || true

echo
echo "== OTel Demo =="
kubectl get pods -n demo

echo
echo "== Services =="
kubectl get svc -n demo
