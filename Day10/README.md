# Day 10: AWS S3 Object Lifecycle Management & Automated Storage Archival

## 📌 Executive Summary
Engineered automated S3 Object Lifecycle Rules using JSON policy definitions to optimize storage costs by transitioning stale objects to Glacier and enforcing expiration policies for multi-tier data management.

---

## 🎯 Production Engineering Steps

### 1. S3 Lifecycle Policy Configuration
Authored a JSON policy (`lifecycle.json`) to define multi-tier storage transition rules:
- Transition objects to **S3 Standard-IA** after 30 days.
- Transition objects to **S3 Glacier Flexible Retrieval** after 90 days.
- Permanently expire/delete objects after 365 days.

```json
{
  "Rules": [
    {
      "ID": "ArchiveAndExpirePolicy",
      "Status": "Enabled",
      "Filter": {
        "Prefix": "logs/"
      },
      "Transitions": [
        {
          "Days": 30,
          "StorageClass": "STANDARD_IA"
        },
        {
          "Days": 90,
          "StorageClass": "GLACIER"
        }
      ],
      "Expiration": {
        "Days": 365
      }
    }
  ]
}
```

### 2. Applying Policy via AWS CLI
Applied the lifecycle rule configuration directly to the target S3 bucket using AWS CLI commands:

```bash
# Apply S3 lifecycle configuration
aws s3api put-bucket-lifecycle-configuration \
  --bucket faiz-static-web-2026 \
  --lifecycle-configuration file://lifecycle.json

# Verify active lifecycle policies on the bucket
aws s3api get-bucket-lifecycle-configuration \
  --bucket faiz-static-web-2026
```

---

## 🔐 Engineering Deliverables
- **Automated Lifecycle Policy:** Configured tier transitions (Standard $\rightarrow$ Standard-IA $\rightarrow$ Glacier $\rightarrow$ Expired).
- **Cost Optimization:** Enforced lifecycle boundaries to reduce long-term cloud storage expenditure.
- **CLI Management:** Provisioned policies seamlessly using `aws s3api`.
