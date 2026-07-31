#!/bin/bash
# Day 04: Application Server Setup & Port Inspection Script
# Author: Mohammad Faiz Ansari

set -euo pipefail

PORT=8000

echo "=== [1/2] Checking Active Network Sockets ==="
if ss -tulpn | grep -q ":$PORT"; then
    echo "Port $PORT is already in use."
else
    echo "Port $PORT is free. Starting Python HTTP Server..."
    nohup python3 -m http.server "$PORT" > app_server.log 2>&1 &
    sleep 2
fi

echo "=== [2/2] Verifying Application Status ==="
ss -tulpn | grep ":$PORT" || echo "Server startup failed."

echo "=== App Server Online on Port $PORT ==="
echo "Ensure AWS Security Group allows Inbound TCP Traffic on Port $PORT."
