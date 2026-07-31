#!/bin/bash
# Day 10: AWS S3 Lifecycle Policy Deployment Script
# Author: Mohammad Faiz Ansari

set -euo pipefail

BUCKET_NAME="faiz-static-web-2026"

echo "=== [1/2] Applying S3 Bucket Lifecycle Configuration ==="
aws s3api put-bucket-lifecycle-configuration \
  --bucket "$BUCKET_NAME" \
  --lifecycle-configuration file://lifecycle.json

echo "=== [2/2] Verifying Applied Lifecycle Policy ==="
aws s3api get-bucket-lifecycle-configuration --bucket "$BUCKET_NAME"

echo "=== S3 Lifecycle Policy Deployed Successfully ==="
