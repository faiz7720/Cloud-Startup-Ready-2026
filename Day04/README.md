# Day 04: AWS Security Groups & Custom Port Network Troubleshooting

## 📌 Executive Summary
Deployed a background web application on AWS EC2 and resolved live network connectivity blocks (`ERR_CONNECTION_TIMED_OUT`) by troubleshooting virtual firewall rules in AWS Security Groups.

---

## 🎯 Production Engineering Steps

### 1. Application Deployment
Initiated a lightweight Python HTTP server running in the background listening on Custom TCP Port 8000:
```bash
# Launch background web server on Port 8000
python3 -m http.server 8000 &

# Inspect active listening sockets on Linux
ss -tulpn | grep 8000

2. Network Firewall Debugging
Initial browser access via Public IP failed due to default inbound firewall restrictions. Configured AWS Security Group rules to expose port 8000:

Type: Custom TCP

Port Range: 8000

Source: 0.0.0.0/0 (Anywhere IPv4)

🔐 Engineering Deliverables
Port Diagnostic: Inspected active network sockets using Linux CLI tools (ss -tulpn).

AWS Networking: Configured Custom TCP Inbound Rules to manage public cloud access.

Verification: Successfully served web directory listings across public browser endpoints.
