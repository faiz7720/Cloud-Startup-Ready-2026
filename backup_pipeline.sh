#!/bin/bash
BACKUP_DIR=~/project-microservices/backups
TIMESTAMP=$(date +%Y%m%d_%H%M%S)
BACKUP_FILE="db_backup_${TIMESTAMP}.tar.gz"

mkdir -p $BACKUP_DIR

echo "=========================================="
echo " Starting Automated Volume Backup Pipeline"
echo " Target: project-microservices_mongo_data"
echo "=========================================="

docker run --rm \
  --volumes-from production_db \
  -v $BACKUP_DIR:/backup \
  alpine tar czf /backup/$BACKUP_FILE /data/db

if [ -f "$BACKUP_DIR/$BACKUP_FILE" ]; then
    echo " Backup Successful: $BACKUP_FILE"
    echo " Backup Size: $(du -h $BACKUP_DIR/$BACKUP_FILE | cut -f1)"
    echo " Path: $BACKUP_DIR/$BACKUP_FILE"
else
    echo "❌ Backup Failed!"
    exit 1
fi
echo "=========================================="
