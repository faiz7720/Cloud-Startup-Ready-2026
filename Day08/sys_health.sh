#!/bin/bash
set -euo pipefail

LOG_FILE="/tmp/system_health.log"

echo "=== SYSTEM HEALTH CHECK $(date) ===" > "$LOG_FILE"

echo "--- Disk Usage ---" >> "$LOG_FILE"
df -h / >> "$LOG_FILE"

echo "--- Memory Usage ---" >> "$LOG_FILE"
free -h >> "$LOG_FILE"

echo "Health check completed successfully at $(date)" >> "$LOG_FILE"

cat "$LOG_FILE"
