```bash
#!/bin/bash
# Day 03: Automated Environment Provisioning & Logging Script
# Author: Mohammad Faiz Ansari

set -euo pipefail

LOG_DIR="production_logs"
BACKUP_DIR="app_backups"
STATUS_FILE="$LOG_DIR/status.txt"

echo "=== [1/3] Initializing Infrastructure Workspace ==="
mkdir -p "$LOG_DIR" "$BACKUP_DIR"

echo "=== [2/3] Injecting Runtime System Telemetry ==="
echo "==========================================" >> "$STATUS_FILE"
echo "Deployment Log Generated At: $(date)" >> "$STATUS_FILE"
echo "System Uptime & Load Average:" >> "$STATUS_FILE"
uptime >> "$STATUS_FILE"
echo "==========================================" >> "$STATUS_FILE"

echo "=== [3/3] Verification & Output ==="
cat "$STATUS_FILE"

echo "=== Workspace Setup Complete ==="
