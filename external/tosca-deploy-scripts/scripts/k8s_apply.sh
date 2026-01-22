#!/usr/bin/env bash
set -euo pipefail
export KUBECONFIG=/etc/rancher/k3s/k3s.yaml

kubectl apply -f k8s/cnf3.yaml
kubectl rollout status deploy/cnf3
kubectl get pods -l app=cnf3
