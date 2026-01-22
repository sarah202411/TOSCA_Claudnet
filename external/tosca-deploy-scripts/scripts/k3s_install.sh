#!/usr/bin/env bash
set -euo pipefail

if [ -f /etc/rancher/k3s/k3s.yaml ]; then
  echo "[k3s] Already installed"
  exit 0
fi

curl -sfL https://get.k3s.io | sh -
chmod 644 /etc/rancher/k3s/k3s.yaml
echo "[k3s] Installed"
