```bash
#!/bin/bash
# Day 02: Enterprise Identity & Access Control Script
# Author: Mohammad Faiz Ansari

set -euo pipefail

WORKSPACE="/opt/app_workspace"
GROUP_NAME="devops_team"
USER_NAME="faiz"

echo "=== [1/3] Setting Up Security Groups ==="
sudo groupadd -f "$GROUP_NAME"

echo "=== [2/3] Provisioning Engineer Account ==="
if ! id -u "$USER_NAME" >/dev/null 2>&1; then
    sudo useradd -m -s /bin/bash "$USER_NAME"
    echo "User $USER_NAME successfully created."
fi
sudo usermod -aG "$GROUP_NAME" "$USER_NAME"

echo "=== [3/3] Hardening Workspace Permissions ==="
sudo mkdir -p "$WORKSPACE"
sudo chown -R "$USER_NAME:$GROUP_NAME" "$WORKSPACE"
sudo chmod 750 "$WORKSPACE"

echo "=== Access Control Verification ==="
ls -ld "$WORKSPACE"
