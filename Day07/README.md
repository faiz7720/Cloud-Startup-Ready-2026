# Day 07: Automated Linux Backup Workflows & Background Scheduling via Cron

## 📌 Executive Summary
Configured automated background system tasks on AWS EC2 using the Linux `cron` daemon, coupled with defensive shell scripting and isolated file permissions (`chmod 700`) to enable continuous, non-interactive backup workflows.

---

## 🎯 Production Engineering Steps

### 1. Cron Job Automation & Scheduling
Configured the cron daemon (`crontab -e`) to execute background backup scripts automatically on a scheduled interval without manual intervention:

```bash
# Open crontab editor
crontab -e

# Example schedule: Execute backup script every day at midnight
0 0 * * * /home/ubuntu/cron_labs/backup.sh >> /home/ubuntu/cron_labs/backups/cron_execution.log 2>&1
```

### 2. Defensive Script Isolation & Permissions
Applied strict file execution parameters to isolate the backup pipeline and ensure continuous execution logging:

```bash
# Restrict script execution permissions solely to the file owner
chmod 700 backup.sh

# Verify directory permissions
ls -ld /home/ubuntu/cron_labs
```

---

## 🔐 Engineering Deliverables
- **Task Automation:** Background task scheduling via `crontab`.
- **System Isolation:** Hardened script permissions (`700` = Owner execution only).
- **Log Persistence:** Historical execution tracking via output redirection (`>>`).
