#!/bin/bash
# Day 05: AWS S3 Static Website Deployment & Policy Script
# Author: Mohammad Faiz Ansari

set -euo pipefail

BUCKET_NAME="faiz-static-web-2026"
REGION="us-east-1"

echo "=== [1/3] Provisioning S3 Bucket ==="
aws s3 mb "s3://$BUCKET_NAME" --region "$REGION" || echo "Bucket already exists."

echo "=== [2/3] Uploading Web Assets ==="
cat << 'EOF' > index.html
<!DOCTYPE html>
<html>
<head><title>Cloud Startup Ready 2026</title></head>
<body><h1>AWS S3 Static Web Hosting - Day 05 Executed Successfully</h1></body>
</html>
EOF

aws s3 cp index.html "s3://$BUCKET_NAME/index.html"

echo "=== [3/3] Applying Public Read Bucket Policy ==="
aws s3api put-bucket-policy --bucket "$BUCKET_NAME" --policy file://bucket_policy.json

echo "=== Static Website Live ==="
echo "URL: http://$BUCKET_NAME.s3-website-$REGION.amazonaws.com"
