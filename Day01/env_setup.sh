#!/bin/bash
# Day 01: Cloud Linux Environment Setup Script

echo "=== Initializing Cloud Infrastructure Setup ==="
sudo apt update -y
sudo apt install -y curl wget git net-tools htop

echo "=== Checking System Specs ==="
uname -a
df -h
free -m

echo "=== Day 01 Environment Ready ==="
