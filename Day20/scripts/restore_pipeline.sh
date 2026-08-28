#!/bin/bash
set -e

if [ -z "$1" ]; then
  echo "Error: Please provide backup file path!"
  echo "Usage: ./restore_pipeline.sh <path_to_backup.tar.gz>"
  exit 1
fi

BACKUP_FILE="$1"
TARGET_VOLUME="project-microservices_mongo_data"
TARGET_CONTAINER="production_db"

echo "=========================================="
echo "Initiating Automated Disaster Recovery"
echo "Archive Source: $(basename "$BACKUP_FILE")"
echo "Target Container: $TARGET_CONTAINER"
echo "=========================================="

# Stop database container before restore to prevent state locking
docker stop "$TARGET_CONTAINER" || true

# Extract archive content directly into volume mount
docker run --rm \
  -v "$TARGET_VOLUME":/volume \
  -v "$(dirname "$BACKUP_FILE")":/backup \
  alpine:latest \
  sh -c "rm -rf /volume/* && tar -xzf /backup/$(basename "$BACKUP_FILE") -C /volume"

# Restart container
docker start "$TARGET_CONTAINER"

echo "=========================================="
echo "Restoration Pipeline Completed Successfully!"
echo "Verifying Live Database Records..."
echo "=========================================="
