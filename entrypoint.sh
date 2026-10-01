#!/bin/sh
# VLESS over WebSocket behind a TLS-terminating edge (the edge supplies TLS, hence allow-insecure).
set -eu
: "${VLESS_UUID:?VLESS_UUID is required}"
: "${WS_PATH:?WS_PATH is required}"
PORT="${PORT:-8080}"

CONF=/etc/owox-node
mkdir -p "$CONF"
cat > "$CONF/config.yaml" <<EOF
log-level: warning
ipv6: true
mode: rule
dns:
  enable: true
  ipv6: true
  nameserver: [1.1.1.1, 8.8.8.8]
listeners:
  - name: vless-ws
    type: vless
    listen: 0.0.0.0
    port: ${PORT}
    users:
      - username: owox
        uuid: ${VLESS_UUID}
    ws-path: /${WS_PATH#/}
    allow-insecure: true
rules:
  - MATCH,DIRECT
EOF

exec /mihomo -d "$CONF"
