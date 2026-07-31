#!/bin/bash
# Day 09: Automated Docker Image Build & Container Launch Script
# Author: Mohammad Faiz Ansari

set -euo pipefail

IMAGE_NAME="cloud-app:v1"
CONTAINER_NAME="cloud-web-container"
PORT_MAPPING="8080:80"

echo "=== [1/3] Building Custom Docker Image ==="
docker build -t "$IMAGE_NAME" .

echo "=== [2/3] Cleaning Existing Container (If Any) ==="
docker rm -f "$CONTAINER_NAME" 2>/dev/null || true

echo "=== [3/3] Launching Containerized Application ==="
docker run -d -p "$PORT_MAPPING" --name "$CONTAINER_NAME" "$IMAGE_NAME"

echo "=== Container Status ==="
docker ps -f "name=$CONTAINER_NAME"
