# Day 08: AWS IAM Identity & Access Management & Least Privilege Policies

## 📌 Executive Summary
Engineered custom IAM security policies adhering to the **Principle of Least Privilege (PoLP)**, isolating AWS resource access for developer groups and configuring programmatic CLI credentials securely.

---

## 🎯 Production Engineering Steps

### 1. Custom Least Privilege IAM Policy Authoring
Created a granular IAM JSON policy (`iam_policy.json`) restricting developer access exclusively to designated S3 storage buckets while revoking administrative control:

```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "AllowSpecificS3Access",
      "Effect": "Allow",
      "Action": [
        "s3:GetObject",
        "s3:PutObject",
        "s3:ListBucket"
      ],
      "Resource": [
        "arn:aws:s3:::faiz-static-web-2026",
        "arn:aws:s3:::faiz-static-web-2026/*"
      ]
    }
  ]
}
```

### 2. AWS CLI Profile Configuration & Identity Verification
Configured programmatic access credentials locally using the AWS CLI and verified authenticated identities:

```bash
# Configure AWS CLI profile for developer user
aws configure --profile dev-user

# Verify active IAM caller identity
aws sts get-caller-identity --profile dev-user
```

---

## 🔐 Engineering Deliverables
- **IAM Policy Architecture:** Enforced least-privilege scoping via structured JSON.
- **Access Control:** Isolated cloud storage permissions to prevent broad administrative exposure.
- **CLI Authentication:** Secure profile configuration and caller identity verification.
