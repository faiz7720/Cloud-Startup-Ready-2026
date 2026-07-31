# Day 01: Cloud Linux Environment Connection & Package Management

## 🎯 Lab Overview
This lab covers setting up the core AWS EC2 cloud infrastructure on Ubuntu 24.04 LTS, establishing secure SSH communication using OpenSSH key pairs, and managing Linux system packages.

---

## 🛠️ Key Execution Steps

### 1. Key Permission Management (Windows Workstation)
To ensure secure SSH handshakes, private key permissions were strictly locked down using Windows ACLs:
```cmd
icacls "your-key.pem" /reset
icacls "your-key.pem" /grant:r "%username%:R"
icacls "your-key.pem" /inheritance:r

ssh -i "your-key.pem" ubuntu@<YOUR_EC2_PUBLIC_IP>

sudo apt update && sudo apt upgrade -y
sudo apt install -y curl wget git unzip
