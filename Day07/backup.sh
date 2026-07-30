#!/bin/bash
set -euo pipefail

BACKUP_DIR="/tmp/backups"
mkdir -p "$BACKUP_DIR"

echo "Automated Backup Executed at $(date)" >> "$BACKUP_DIR/backup_log.txt"
