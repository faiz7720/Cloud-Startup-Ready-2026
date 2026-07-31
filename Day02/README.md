# Day 02: Enterprise Identity & Access Control on AWS EC2

## 📌 Executive Summary
Configured role-based user access controls, group isolation, and strict permission boundaries on an Amazon EC2 Linux instance to enforce the **Principle of Least Privilege (PoLP)** across cloud environments.

---

## 🎯 Production Engineering Steps

### 1. User & Group Lifecycle Provisioning
Created a dedicated `devops_team` engineering group and provisioned a non-root system user `faiz` with custom shell access:
```bash
# Verify system identities
cat /etc/passwd | tail -n 5

# Create security group & engineering user
sudo groupadd -f devops_team
sudo useradd -m -s /bin/bash faiz
sudo usermod -aG devops_team faiz

# Assign group ownership
sudo chown -R faiz:devops_team /opt/app_workspace

# Enforce secure permission masks
sudo chmod 750 /opt/app_workspace
