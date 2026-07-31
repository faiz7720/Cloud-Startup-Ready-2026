# Day 06: Automated System Health Check & Defensive Shell Scripting

## 📌 Executive Summary
Engineered a production-grade Bash monitoring script on AWS EC2 to automate server health metrics collection (`disk` & `memory`) while enforcing strict defensive execution parameters (`set -euo pipefail`) to prevent cascading pipeline failures.

---

## 🎯 Production Engineering Steps

### 1. System Health Telemetry Automation
Wrote a shell script (`sys_health.sh`) to inspect root partition storage (`df -h /`) and RAM utilization metrics (`free -h`), redirecting logs safely to `/tmp/system_health.log`:

```bash
# Execute health check script
chmod +x sys_health.sh
./sys_health.sh

# Verify generated telemetry logs
cat /tmp/system_health.log
```

### 2. Defensive Execution & Failure Boundary Testing
Applied strict bash flags to instantly halt execution upon command failure or unbound variable usage:

```bash
# Strict execution flags applied inside script:
# -e : Exit immediately if a command exits with a non-zero status
# -u : Treat unset variables as an error
# -o pipefail : Return status of the last command to exit with a non-zero status
set -euo pipefail
```

---

## 🔐 Engineering Deliverables
- **System Monitoring:** Automated root partition and RAM performance metric capture.
- **Defensive Error Handling:** Enforced strict execution boundaries using `set -euo pipefail`.
- **Log Management:** Redirected telemetry outputs cleanly with timestamping.
