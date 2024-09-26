#!/bin/bash

# Install unzip
sudo apt update
sudo apt install -y unzip

# Install kubectl
echo "Installing kubectl..."
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
rm kubectl  # Clean up

# Install AWS CLI
echo "Installing AWS CLI..."
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
rm awscliv2.zip  # Clean up
rm -rf aws  # Clean up

# Get Windows username
WINDOWS_USERNAME=$(cmd.exe /c "echo %USERNAME%" | tr -d '\r')

# Set environment variable in .bashrc
echo "export AWS_SHARED_CREDENTIALS_FILE=/mnt/c/Users/$WINDOWS_USERNAME/.aws/credentials" >> ~/.bashrc

# Test installations
echo "Testing installations..."
kubectl version --client
aws --version

echo "Installation complete. Please restart your terminal or run 'source ~/.bashrc' to apply changes."
