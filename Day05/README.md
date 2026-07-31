# Day 05: AWS S3 Static Website Hosting & Public Bucket Policies

## 📌 Executive Summary
Configured static web application hosting on Amazon S3, authored granular JSON bucket policies to enforce secure public read access, and executed AWS CLI storage administration tasks.

---

## 🎯 Production Engineering Steps

### 1. S3 Bucket Provisioning & Static Hosting
Created an S3 bucket and enabled static website hosting configuration:
```bash
# Create globally unique S3 bucket
aws s3 mb s3://faiz-static-web-2026

# Upload web assets (index.html, styles)
aws s3 cp index.html s3://faiz-static-web-2026/

2. Public Access & IAM Bucket Policy Application
Configured S3 Block Public Access settings and applied a public read policy (bucket_policy.json) for web asset delivery:

JSON
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "PublicReadGetObject",
      "Effect": "Allow",
      "Principal": "*",
      "Action": "s3:GetObject",
      "Resource": "arn:aws:s3:::faiz-static-web-2026/*"
    }
  ]
}
🔐 Engineering Deliverables
Object Storage Hosting: Served decoupled web assets via AWS S3 endpoints.

IAM Policy Control: Restricted administrative write rights while granting public read access (s3:GetObject).

CLI Management: Executed file deployment and permission syncing using AWS CLI.
