#!/bin/sh
set -eu

mkdir -p /data/auths

if [ ! -f /data/config.yaml ]; then
  cat > /data/config.yaml <<EOF
port: 8317

remote-management:
  allow-remote: true
  secret-key: "${REMOTE_MANAGEMENT_SECRET}"
  disable-control-panel: false

auth-dir: "/data/auths"

debug: false
logging-to-file: false
usage-statistics-enabled: false
request-retry: 3

quota-exceeded:
  switch-project: true
  switch-preview-model: true

api-keys:
  - "${CLIENT_API_KEY}"
EOF
fi

exec /CLIProxyAPI/CLIProxyAPI --config /data/config.yaml
