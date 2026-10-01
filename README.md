# owox-node

VLESS-over-WebSocket server for OwoX, meant to run behind a TLS-terminating edge.

## Environment

| Name | Required | Meaning |
| --- | --- | --- |
| `VLESS_UUID` | yes | client UUID |
| `WS_PATH` | yes | WebSocket path, with or without leading `/` |
| `PORT` | no | listen port, default `8080` |

## Client

```yaml
- name: <name>
  type: vless
  server: <host>
  port: 443
  uuid: <uuid>
  udp: true
  tls: true
  servername: <host>
  client-fingerprint: chrome
  network: ws
  ws-opts:
    path: /<path>
    headers:
      Host: <host>
```
