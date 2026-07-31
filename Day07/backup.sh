#!/bin/bash
# Day 07: Automated Background Backup Script
# Author: Mohammad Faiz Ansari

set -euo pipefail

BACKUP_DIR="$HOME/cron_labs/backups"
LOG_FILE="$BACKUP_DIR/backup.log"

echo "=== [1/2] Initializing Scheduled Backup Directory ==="
mkdir -p "$BACKUP_DIR"

echo "=== [2/2] Executing System Log Snapshot ==="
echo "------------------------------------------" >> "$LOG_FILE"
echo "Automated Cron Backup Executed At: $(date)" >> "$LOG_FILE"
echo "Memory Status During Backup:" >> "$LOG_FILE"
free -h >> "$LOG_FILE"
echo "------------------------------------------" >> "$LOG_FILE"

echo "Backup Task Logged Successfully to $LOG_FILE"
