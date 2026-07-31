#!/bin/bash
# Day 06: Automated System Health Check Script
# Author: Mohammad Faiz Ansari

set -euo pipefail

LOG_FILE="/tmp/system_health.log"

echo "=== [1/3] Initializing System Telemetry Scan: $(date) ===" > "$LOG_FILE"

echo -e "\n--- [Disk Usage Metrics] ---" >> "$LOG_FILE"
df -h / >> "$LOG_FILE"

echo -e "\n--- [Memory Usage Metrics] ---" >> "$LOG_FILE"
free -h >> "$LOG_FILE"

echo -e "\n=== Scan Completed Successfully ===" >> "$LOG_FILE"

# Output log content to stdout
cat "$LOG_FILE"
