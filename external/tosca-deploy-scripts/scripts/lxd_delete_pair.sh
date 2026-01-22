#!/usr/bin/env bash
set -euo pipefail

VNF_NAME="${1:?Usage: lxd_delete_pair.sh <vnf_name>}"

for c in "${VNF_NAME}-comp1" "${VNF_NAME}-comp2"; do
  if lxc list "$c" >/dev/null 2>&1; then
    lxc delete "$c" --force
  fi
done

echo "[LXD] Removed: $VNF_NAME"
