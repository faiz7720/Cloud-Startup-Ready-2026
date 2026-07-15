# Day 1: Cloud Linux Environment Connection & Package Management

## Technical Execution:
- Deployed a secure Ubuntu 24.04 LTS instance on AWS EC2.
- Configured local machine OpenSSH client and handled private key access control using Windows `icacls`.
- Executed core OS updates using the advanced package tool (`sudo apt update && sudo apt upgrade -y`).

## Infrastructure Concepts Applied:
- **Linux File System Architecture:** Root hierarchy isolation (`/etc`, `/var`, `/home`).
- **Networking/Security:** Verified remote infrastructure handshakes via port 22 (SSH).
