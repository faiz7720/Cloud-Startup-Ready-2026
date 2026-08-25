#!/bin/bash
BACKUP_DIR="./backups"
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
mkdir -p "$BACKUP_DIR"

echo "Starting automated MongoDB volume snapshot..."
docker run --rm \
  --volumes-from production_db \
  -v "$(pwd)/$BACKUP_DIR":/backup \
  alpine tar -czf "/backup/db_backup_${TIMESTAMP}.tar.gz" /data/db

echo "Backup completed successfully: db_backup_${TIMESTAMP}.tar.gz"
