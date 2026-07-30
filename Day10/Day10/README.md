# Day 10: AWS S3 Lifecycle Policies & Automated Cost Optimization

Implemented production-ready S3 Lifecycle Rules using JSON policy configurations via AWS CLI to automate object transitions and storage class tiering for cost reduction.

---

## 🛠️ Infrastructure & Execution Strategy

To prevent unnecessary S3 storage costs for long-term logs, an automated tiering lifecycle was configured:
* **Standard Storage:** Active data access (0-30 days).
* **Standard-Infrequent Access (STANDARD_IA):** Transitioned after 30 days for low-frequency logs.
* **Glacier Retrieval:** Transitioned after 90 days for archival & compliance.
* **Expiration:** Permanent object deletion after 365 days.

---

## 📄 Lifecycle Configuration (`lifecycle.json`)

```json
{
  "Rules": [
    {
      "ID": "MoveToIAAndGlacierThenDelete",
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

# 1. Create target S3 bucket dynamically
BUCKET_NAME="faiz-lifecycle-demo-$(date +%s)"
aws s3 mb s3://$BUCKET_NAME --region us-east-1

# 2. Apply Lifecycle policy to bucket
aws s3api put-bucket-lifecycle-configuration \
  --bucket $BUCKET_NAME \
  --lifecycle-configuration file://lifecycle.json

# 3. Verify Lifecycle configuration active state
aws s3api get-bucket-lifecycle-configuration --bucket $BUCKET_NAME
{
    "Rules": [
        {
            "Expiration": {
                "Days": 365
            },
            "ID": "MoveToIAAndGlacierThenDelete",
            "Status": "Enabled",
            "Transitions": [
                {
                    "Days": 30,
                    "StorageClass": "STANDARD_IA"
                }
            ]
        }
    ]
}
