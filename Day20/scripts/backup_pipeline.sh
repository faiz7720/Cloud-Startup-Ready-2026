#!/bin/bash
set -e

BACKUP_DIR="/home/ubuntu/project-microservices/backups"
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
BACKUP_NAME="db_backup_${TIMESTAMP}.tar.gz"
TARGET_VOLUME="project-microservices_mongo_data"

echo "=========================================="
echo "Starting Automated Volume Backup Pipeline"
echo "Target: $TARGET_VOLUME"
echo "=========================================="

mkdir -p "$BACKUP_DIR"

# Docker run temporary alpine container to compress volume data cleanly
docker run --rm \
  -v "$TARGET_VOLUME":/volume:ro \
  -v "$BACKUP_DIR":/backup \
  alpine:latest \
  tar -czf "/backup/$BACKUP_NAME" -C /volume .

FILE_SIZE=$(du -sh "$BACKUP_DIR/$BACKUP_NAME" | cut -f1)

echo "Backup Successful: $BACKUP_NAME"
echo "Backup Size: $FILE_SIZE"
echo "Path: $BACKUP_DIR/$BACKUP_NAME"
echo "=========================================="
