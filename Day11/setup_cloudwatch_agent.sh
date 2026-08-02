#!/bin/bash
# Day 11: Automated AWS CloudWatch Agent Setup Script

set -e

echo "=== 1. Downloading CloudWatch Agent Package ==="
wget -q https://amazoncloudwatch-agent.s3.amazonaws.com/ubuntu/amd64/latest/amazon-cloudwatch-agent.deb

echo "=== 2. Installing Debian Package ==="
sudo dpkg -i -E ./amazon-cloudwatch-agent.deb

echo "=== 3. Creating Configuration Directory ==="
sudo mkdir -p /opt/aws/amazon-cloudwatch-agent/etc/

echo "=== 4. Copying Configuration File ==="
sudo cp amazon-cloudwatch-agent.json /opt/aws/amazon-cloudwatch-agent/etc/

echo "=== 5. Starting CloudWatch Agent Service ==="
sudo /opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-ctl \
  -a fetch-config \
  -m ec2 \
  -c file:/opt/aws/amazon-cloudwatch-agent/etc/amazon-cloudwatch-agent.json \
  -s

echo "=== 6. Verifying Service Status ==="
sudo systemctl status amazon-cloudwatch-agent --no-pager
