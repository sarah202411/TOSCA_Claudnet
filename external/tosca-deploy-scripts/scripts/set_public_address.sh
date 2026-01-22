#!/usr/bin/env bash
set -euo pipefail
# xOpera reads operation outputs and stores them as node attributes.
# We output public_address for the host to satisfy SoftwareComponent HOST execution.
echo "public_address=127.0.0.1"
