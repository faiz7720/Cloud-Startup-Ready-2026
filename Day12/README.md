# Day 12: Linux Process Management & Systemd Service Operations

## 📌 Executive Summary
Mastered Linux process inspection, signal handling (`kill`), and system service lifecycle management (`systemctl`) to troubleshoot server resources and maintain continuous application uptime on EC2 Linux nodes.

---

## 🎯 Production Engineering Steps

### 1. Process Inspection & Filtering
Checked real-time resource utilization and isolated background processes:

```bash
# Real-time process & resource viewer
top

# Filtered process tree snapshot
ps aux | head -n 15

# Search specific process by name
ps aux | grep "sleep 300"
```

### 2. Process Lifecycle & Signal Termination
Spawned a background job and forcefully sent process termination signals:

```bash
# Spawn background process
sleep 300 &

# Terminate process by PID using SIGKILL (Signal 9)
kill -9 1408
```

### 3. Service Daemon Operations (`systemctl`)
Verified system service state and operational health for SSH core service:

```bash
# Inspect systemd unit service status
sudo systemctl status ssh
```

---

## 🔐 Engineering Deliverables
- **Resource Monitoring:** Analyzed CPU, Memory, and Process ID (PID) dynamics using `top` and `ps`.
- **Signal Control:** Implemented `kill -9` for non-responsive process termination.
- **Service Stability:** Verified `systemd` daemon management for core infrastructure services.
