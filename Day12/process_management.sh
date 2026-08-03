#!/bin/bash
# Day 12: Automated Process Inspection & Service Verification Script

set -e

echo "=== 1. Active System Processes (Top 10) ==="
ps aux --sort=-%cpu | head -n 10

echo "=== 2. Spawning Demo Background Process ==="
sleep 300 &
DEMO_PID=$!
echo "Demo Process Started with PID: $DEMO_PID"

echo "=== 3. Terminating Process via SIGKILL ==="
kill -9 $DEMO_PID
echo "Process $DEMO_PID successfully terminated."

echo "=== 4. Verifying SSH Service Status ==="
sudo systemctl status ssh --no-pager
