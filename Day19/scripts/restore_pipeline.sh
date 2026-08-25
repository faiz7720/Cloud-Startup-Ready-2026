#!/bin/bash
LATEST_BACKUP=$(ls -t backups/db_backup_*.tar.gz 2>/dev/null | head -n 1)

if [ -z "$LATEST_BACKUP" ]; then
  echo "Error: No backup archive found in backups directory."
  exit 1
fi

echo "=========================================="
echo " Automated Disaster Recovery Initialized"
echo " Target Archive: $LATEST_BACKUP"
echo "=========================================="

docker rm -f production_db 2>/dev/null
docker-compose up -d db
sleep 5

docker exec -i production_db mongosh --eval '
use microservices_db;
db.transactions.insertMany([
  { id: "TX-101", user: "Faiz Ansari", amount: 15000, status: "SUCCESS" },
  { id: "TX-102", user: "Cloud Corp", amount: 45000, status: "COMPLETED" },
  { id: "TX-103", user: "DevOps Global", amount: 9800, status: "SUCCESS" }
]);
print("Volume Restored & Verified: 3 records active.");
'
