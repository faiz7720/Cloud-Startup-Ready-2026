#!/bin/bash
set -euo pipefail

LOCAL_LOG_DIR="/tmp/day09_logs"
S3_TARGET_BUCKET="s3://$1"

mkdir -p "$LOCAL_LOG_DIR"
echo "Production System Log generated at $(date)" > "$LOCAL_LOG_DIR/app_$(date +%F_%H-%M-%S).log"

aws s3 sync "$LOCAL_LOG_DIR" "$S3_TARGET_BUCKET" --delete

echo "Successfully synchronized local logs to AWS S3 Bucket: $1"
