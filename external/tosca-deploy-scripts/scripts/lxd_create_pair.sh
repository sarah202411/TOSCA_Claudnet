#!/usr/bin/env bash
set -euo pipefail

VNF_NAME="${1:?Usage: lxd_create_pair.sh <vnf_name> [image]}"
IMAGE="${2:-ubuntu:22.04}"

C1="${VNF_NAME}-comp1"
C2="${VNF_NAME}-comp2"

echo "[LXD] Creating $C1 and $C2 from $IMAGE"

# Use lxc info to test existence reliably
if ! lxc info "$C1" >/dev/null 2>&1; then
  lxc launch "$IMAGE" "$C1"
else
  echo "[LXD] $C1 already exists"
fi

if ! lxc info "$C2" >/dev/null 2>&1; then
  lxc launch "$IMAGE" "$C2"
else
  echo "[LXD] $C2 already exists"
fi

# Example payload service (replace nginx with your real VNF)
for c in "$C1" "$C2"; do
  lxc exec "$c" -- bash -lc "apt update && apt install -y nginx && systemctl enable --now nginx"
done

echo "[LXD] Done: $VNF_NAME"
