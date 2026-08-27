#!/bin/bash
BACKUP_DIR=~/project-microservices/backups
LATEST_BACKUP=$(ls -t $BACKUP_DIR/db_backup_*.tar.gz | head -1)

if [ -z "$LATEST_BACKUP" ]; then
    echo "❌ No backup archive found in $BACKUP_DIR"
    exit 1
fi

echo "=========================================="
echo " Initiating Automated Disaster Recovery"
echo " Archive Source: $(basename $LATEST_BACKUP)"
echo " Target Container: production_db"
echo "=========================================="

# Extract backup tar into temporary mount
docker run --rm \
  --volumes-from production_db \
  -v $BACKUP_DIR:/backup \
  alpine sh -c "cd / && tar xzf /backup/$(basename $LATEST_BACKUP)"

# Restart DB container to re-index restored storage
docker restart production_db > /dev/null

sleep 3

echo " Restoration Pipeline Completed Successfully!"
echo " Verifying Live Database Records..."
echo "=========================================="

docker exec -i production_db mongosh --eval '
use microservices_db;
print(" Restored Document Count: " + db.transactions.countDocuments());
db.transactions.find().pretty();
'
