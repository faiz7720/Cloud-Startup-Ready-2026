# Day 11: AWS CloudWatch Agent Installation & Centralized System Logging

## 📌 Executive Summary
Deployed and configured the AWS CloudWatch Unified Agent on an EC2 Linux instance to stream core system logs (`/var/log/syslog`) to Amazon CloudWatch Logs for centralized monitoring and log aggregation.

---

## 🎯 Production Engineering Steps

### 1. CloudWatch Agent Installation
Downloaded and installed the official CloudWatch agent package:

```bash
# Download Debian package
wget [https://amazoncloudwatch-agent.s3.amazonaws.com/ubuntu/amd64/latest/amazon-cloudwatch-agent.deb](https://amazoncloudwatch-agent.s3.amazonaws.com/ubuntu/amd64/latest/amazon-cloudwatch-agent.deb)

# Install package
sudo dpkg -i -E ./amazon-cloudwatch-agent.deb
```

### 2. Custom JSON Configuration Setup
Authored a custom configuration file at `/opt/aws/amazon-cloudwatch-agent/etc/amazon-cloudwatch-agent.json` to define log retention and ingestion parameters:

```json
{
  "agent": {
    "run_as_user": "root"
  },
  "logs": {
    "logs_collected": {
      "files": {
        "collect_list": [
          {
            "file_path": "/var/log/syslog",
            "log_group_name": "/aws/ec2/system-logs",
            "log_stream_name": "{instance_id}",
            "retention_in_days": 7
          }
        ]
      }
    }
  }
}
```

### 3. Agent Service Execution & Verification
Loaded the configuration schema and initialized the agent service:

```bash
# Fetch config and start agent
sudo /opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-ctl \
  -a fetch-config \
  -m ec2 \
  -c file:/opt/aws/amazon-cloudwatch-agent/etc/amazon-cloudwatch-agent.json \
  -s

# Verify running service status
sudo systemctl status amazon-cloudwatch-agent
```

---

## 🔐 Engineering Deliverables
- **Centralized Logging:** Enabled streaming of system-level logs to CloudWatch Log Groups.
- **Retention Control:** Configured a 7-day retention limit to optimize storage expenditure.
- **Service Management:** Provisioned `amazon-cloudwatch-agent` systemd service for automatic reboot survival.
